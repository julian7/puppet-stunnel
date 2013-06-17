require 'spec_helper'

describe 'stunnel::service' do
  context do
    let(:params) {{ensure: 'ensure'}}

    it do
      should contain_service('stunnel4').with(
        ensure: 'running',
        hasstatus: false,
        hasrestart: true,
        enable: true,
        require: ['Class[Stunnel::Package]', 'Class[Stunnel::Files]']
      )
    end
  end

  context 'with ensure: absent' do
    let(:params) {{ensure: 'absent'}}

    it do
      should contain_service('stunnel4').with_ensure('absent')
    end
  end
end
