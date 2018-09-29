require 'spec_helper'

describe 'shellinabox' do

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('shellinabox::config') }
      it { is_expected.to contain_class('shellinabox::install') }
      it { is_expected.to contain_class('shellinabox::service') }
      it { is_expected.to contain_package('shellinabox') }
      it { is_expected.to contain_service('shellinaboxd') }
      it { is_expected.to contain_file('/etc/sysconfig/shellinaboxd').with_content(<<-EOS.gsub(/^ {8}/, '')) }
        # !!! Managed by Puppet !!!

        USER=shellinabox
        GROUP=shellinabox
        CERTDIR=/var/lib/shellinabox
        PORT=4200
        OPTS="--disable-ssl-menu --service '/:LOGIN'"
        EOS
    end
  end
end
