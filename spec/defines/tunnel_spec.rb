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

  it do
    should contain_file('/etc/stunnel/sampletun.conf').with(
      ensure: 'ensure',
      mode: '0644',
      owner: 'root',
      group: 'root',
      notify: 'Class[Stunnel::Service]',
      content: <<-SAMPLETUN
sslVersion = SSLv3
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
end
