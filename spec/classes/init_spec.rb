require 'spec_helper'

describe 'stunnel' do
  context do
    it do
      should contain_class('stunnel::package').with_ensure('present')
      should contain_class('stunnel::files').with_ensure('present')
      should contain_class('stunnel::service').with_ensure('running')
    end
  end

  context 'with ensure: latest' do
    let(:params) {{ensure: 'latest'}}
    it do
      should contain_class('stunnel::package').with_ensure('latest')
      should contain_class('stunnel::files').with_ensure('present')
      should contain_class('stunnel::service').with_ensure('running')
    end
  end

  context 'with ensure: absent' do
    let(:params) {{ensure: 'absent'}}
    it do
      should contain_class('stunnel::package').with_ensure('absent')
      should contain_class('stunnel::files').with_ensure('absent')
      should contain_class('stunnel::service').with_ensure('absent')
    end
  end
end
