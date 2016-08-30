component 'gpg_key' do |pkg, settings, platform|
  pkg.version '2016.08.19'

  if platform.is_deb?
    pkg.add_source 'file://files/puppetlabs-keyring.gpg'
    pkg.install_file 'puppetlabs-keyring.gpg', '/etc/apt/trusted.gpg.d/puppetlabs-pc1-keyring.gpg'
  else
    pkg.add_source("file://files/RPM-GPG-KEY-puppetlabs.gpg")
    pkg.add_source("file://files/RPM-GPG-KEY-puppet.asc")
    pkg.add_source("file://files/RPM-GPG-KEY-nightly-puppetlabs")
    pkg.install_file 'RPM-GPG-KEY-puppetlabs.gpg', '/etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs-PC1'
    pkg.install_file 'RPM-GPG-KEY-puppet.asc', '/etc/pki/rpm-gpg/RPM-GPG-KEY-puppet-PC1'
    pkg.install_file 'RPM-GPG-KEY-nightly-puppetlabs', '/etc/pki/rpm-gpg/RPM-GPG-KEY-nightly-puppetlabs'
  end
end