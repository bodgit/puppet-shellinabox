require 'spec_helper_acceptance'

describe 'shellinabox' do

  it 'should work with no errors' do

    pp = <<-EOS
      include ::epel

      class { '::shellinabox':
        require => Class['::epel'],
      }
    EOS

    apply_manifest(pp, :catch_failures => true)
    apply_manifest(pp, :catch_changes  => true)
  end

  describe package('shellinabox') do
    it { is_expected.to be_installed }
  end

  describe file('/etc/sysconfig/shellinaboxd'), if: fact('osfamily').eql?('RedHat') do
    it { is_expected.to be_file }
    it { is_expected.to be_mode 644 }
    it { is_expected.to be_owned_by 'root' }
    it { is_expected.to be_grouped_into 'root' }
  end

  describe service('shellinaboxd') do
    it { is_expected.to be_enabled }
    it { is_expected.to be_running }
  end
end
