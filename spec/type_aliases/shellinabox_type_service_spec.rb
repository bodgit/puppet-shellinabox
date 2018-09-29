require 'spec_helper'

describe 'ShellInABox::Type::Service' do
  it { is_expected.to allow_values('LOGIN', 'SSH', ['SSH'], ['SSH', 'example.com'], ['test', 'test', 'HOME', 'SHELL'], ['test', 'test', '/some/path', 'test']) }
  it { is_expected.not_to allow_value('invalid', -1) }
end
