component 'repo_definition' do |pkg, settings, platform|
  pkg.version '2015.03.31'

  if platform.is_deb?
    pkg.url 'file://files/puppetlabs.list.txt'
    pkg.md5sum 'f6fea0cbba6cdc10d904ea17572335b7'
    pkg.install_file 'puppetlabs.list.txt', '/etc/apt/sources.list.d/puppetlabs-pc1.list'
    pkg.install do
      "sed -i 's|__CODENAME__|#{platform.codename}|g' /etc/apt/sources.list.d/puppetlabs-pc1.list"
    end
  else
    pkg.url 'file://files/puppetlabs.repo.txt'
    pkg.md5sum '5f6c6e6f16bd22b11d15817b9df5cb19'
    pkg.install_file 'puppetlabs.repo.txt', '/etc/yum.repos.d/puppetlabs-pc1.repo'
    pkg.install do
      "sed -i -e 's|__OS_NAME__|#{platform.os_name}|g' -e 's|__OS_VERSION__|#{platform.os_version}|g' /etc/yum.repos.d/puppetlabs-pc1.repo"
    end
  end
end
