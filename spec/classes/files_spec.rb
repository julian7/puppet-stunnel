require 'spec_helper'

describe 'stunnel::files' do
  context do
    let(:params) {{ensure: 'ensure'}}
    it do
      should contain_file('/etc/default/stunnel4').with(
        ensure: 'ensure',
        mode: '0644',
        owner: 'root',
        group: 'root',
        require: 'Package[stunnel4]'
      )
      should contain_file('/etc/stunnel').with(
        ensure: 'directory',
        mode: '0755',
        owner: 'root',
        group: 'root',
        recurse: 'true',
        purge: 'true',
        require: 'Package[stunnel4]'
      )
      should contain_file('/var/log/stunnel4').with(
        ensure: 'directory',
        mode: '0755',
        owner: 'stunnel4',
        group: 'stunnel4',
        require: 'Package[stunnel4]'
      )
      should contain_file('/var/lib/stunnel4').with(
        ensure: 'directory',
        mode: '0755',
        owner: 'stunnel4',
        group: 'stunnel4',
        require: 'Package[stunnel4]'
      )
      should contain_file('/etc/logrotate.d/stunnel4').with(
        ensure: 'ensure',
        mode: '0644',
        owner: 'root',
        group: 'root',
        require: 'Package[stunnel4]'
      )
    end
  end

  context 'with ensure: absent' do
    let(:params) {{ensure: 'absent'}}
    it do
      should contain_file('/etc/default/stunnel4').with_ensure('absent')
      should contain_file('/etc/stunnel').with_ensure('absent')
      should contain_file('/var/lib/stunnel4').with_ensure('absent')
      should contain_file('/var/log/stunnel4').with_ensure('absent')
      should contain_file('/etc/logrotate.d/stunnel4').with_ensure('absent')
    end
  end
end
