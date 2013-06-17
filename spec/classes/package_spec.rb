require 'spec_helper'

describe 'stunnel::package' do
  let(:params) {{ensure: 'ensure'}}

  it do
    should contain_package('stunnel4').with_ensure('ensure')
  end
end
