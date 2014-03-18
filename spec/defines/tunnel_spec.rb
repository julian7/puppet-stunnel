require 'spec_helper'

describe 'stunnel::tunnel' do
  let(:title) {'sampletun'}
  let(:params) {{
    ensure: 'ensure',
    ca: 'ca-root',
    ssl: 'keyname',
    accept: 'accept:port',
    connect: 'connect:port'
  }}

  it "creates service tunnel config" do
    should contain_file('/etc/stunnel/sampletun.conf').with(
      ensure: 'ensure',
      mode: '0644',
      owner: 'root',
      group: 'root',
      notify: 'Class[Stunnel::Service]',
      content: <<-SAMPLETUN
sslVersion = all
options = NO_SSLv2
client = no
CApath = /etc/ssl/certs/ca-root.pem
cert = /etc/ssl/certs/keyname.pem
key = /etc/ssl/private/keyname.key
setuid = stunnel4
setgid = stunnel4
pid = /var/lib/stunnel4/sampletun.pid

socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

output = /var/log/stunnel4/sampletun.log

[sampletun]
accept = accept:port
connect = connect:port
      SAMPLETUN
    )
  end

  context "SNI" do
    let(:params) {{
      ensure: 'ensure',
      ca: 'ca-root',
      ssl: 'keyname',
      accept: 'accept:port',
      connect: 'connect:port',
      sni: {
        "server.name" => "1.2.3.4:81",
        "other.name" => "1.2.3.5:81"
      }
    }}

    it "gets recorded" do
      should contain_file('/etc/stunnel/sampletun.conf').with(
        ensure: 'ensure',
        mode: '0644',
        owner: 'root',
        group: 'root',
        notify: 'Class[Stunnel::Service]'
      )
      content = subject.resource(
        'file',
        '/etc/stunnel/sampletun.conf'
      )[:content]
      content.should include <<-SAMPLETUN
[sampletun]
accept = accept:port
connect = connect:port

[server.name]
sni = sampletun:server.name
cert = /etc/ssl/certs/server.name.pem
key = /etc/ssl/private/server.name.key
connect = 1.2.3.4:81

[other.name]
sni = sampletun:other.name
cert = /etc/ssl/certs/other.name.pem
key = /etc/ssl/private/other.name.key
connect = 1.2.3.5:81
      SAMPLETUN
    end
  end
end
