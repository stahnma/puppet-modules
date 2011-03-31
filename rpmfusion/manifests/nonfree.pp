

class rpmfusion::nonfree { 
  # Basic rpmfusion-nonfree
  #
  yumrepo { 'rpmfusion-nonfree':
    enabled => '1',
    gpgcheck => '1',
    metadata_expire => '7d',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever-$basearch',
    descr => 'RPM Fusion for Fedora $releasever - Nonfree',
    mirrorlist => 'http://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-$releasever&arch=$basearch'
  }

  yumrepo { 'rpmfusion-nonfree-debuginfo':
    enabled => '0',
    gpgcheck => '1',
    metadata_expire => '7d',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever-$basearch',
    descr => 'RPM Fusion for Fedora $releasever - Nonfree - Debug',
    mirrorlist => 'http://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-debug-$releasever&arch=$basearch'
  }

  yumrepo { 'rpmfusion-nonfree-source':
    enabled => '0',
    gpgcheck => '1',
    metadata_expire => '7d',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever-$basearch',
    descr => 'RPM Fusion for Fedora $releasever - Nonfree - Source',
    mirrorlist => 'http://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-source-$releasever&arch=$basearch'
  }
  
  # rpmfusion-nonfree-updates repos
  yumrepo { 'rpmfusion-nonfree-updates':
    enabled => '1',
    gpgcheck => '1',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever-$basearch',
    descr => 'RPM Fusion for Fedora $releasever - Nonfree - Updates',
    mirrorlist => 'http://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-updates-released-$releasever&arch=$basearch'
  }

  yumrepo { 'rpmfusion-nonfree-updates-debuginfo':
    enabled => '0',
    gpgcheck => '1',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever-$basearch',
    descr => 'RPM Fusion for Fedora $releasever - Nonfree - Updates Debug',
    mirrorlist => 'http://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-updates-released-debug-$releasever&arch=$basearch'
  }

  yumrepo { 'rpmfusion-nonfree-updates-source':
    enabled => '0',
    gpgcheck => '1',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever-$basearch',
    descr => 'RPM Fusion for Fedora $releasever - Nonfree - Updates Source',
    mirrorlist => 'http://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-updates-released-source-$releasever&arch=$basearch'
  }


  # Rpmfusion-nonfree-updates-testing repos
  yumrepo { 'rpmfusion-nonfree-updates-testing':
    enabled => '0',
    gpgcheck => '1',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever-$basearch',
    descr => 'RPM Fusion for Fedora $releasever - Nonfree - Test Updates',
    mirrorlist => 'http://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-updates-testing-$releasever&arch=$basearch'
  }

  yumrepo { 'rpmfusion-nonfree-updates-testing-debuginfo':
    enabled => '0',
    gpgcheck => '1',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever-$basearch',
    descr => 'RPM Fusion for Fedora $releasever - Nonfree - Test Updates Debug',
    mirrorlist => 'http://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-updates-testing-debug-$releasever&arch=$basearch'
  }

  yumrepo { 'rpmfusion-nonfree-updates-testing-source':
    enabled => '0',
    gpgcheck => '1',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever-$basearch',
    descr => 'RPM Fusion for Fedora $releasever - Nonfree - Test Updates Source',
    mirrorlist => 'http://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-updates-testing-source-$releasever&arch=$basearch'
  }

 
  file { 'nonfree-key':
    path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-${operatingsystemrelease}-primary",
    ensure => present,
    source => "puppet:///modules/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-fedora-${operatingsystemrelease}-primary",
    owner => root,
    group => root,
    mode => 644,
  } 

  file { 'RPM-GPG-KEY-rpmfusion-nonfree-fedora':
    path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora",
    ensure => "RPM-GPG-KEY-rpmfusion-nonfree-fedora-${operatingsystemrelease}-primary",
    require => File['nonfree-key']
  }

  file { "RPM-GPG-KEY-rpmfusion-nonfree-fedora-${operatingsystemrelease}-i386":
    path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-${operatingsystemrelease}-i386",
    ensure => "RPM-GPG-KEY-rpmfusion-nonfree-fedora-${operatingsystemrelease}-primary",
    require => File['nonfree-key']
  }

  file { "RPM-GPG-KEY-rpmfusion-nonfree-fedora-${operatingsystemrelease}-ppc":
    path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-${operatingsystemrelease}-ppc",
    ensure => "RPM-GPG-KEY-rpmfusion-nonfree-fedora-${operatingsystemrelease}-primary",
    require => File['nonfree-key']
  }

  file { "RPM-GPG-KEY-rpmfusion-nonfree-fedora-${operatingsystemrelease}-ppc64":
    path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-${operatingsystemrelease}-ppc64",
    ensure => "RPM-GPG-KEY-rpmfusion-nonfree-fedora-${operatingsystemrelease}-primary",
    require => File['nonfree-key']
  }

  file { "RPM-GPG-KEY-rpmfusion-nonfree-fedora-${operatingsystemrelease}-x86_64":
    path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-${operatingsystemrelease}-x86_64",
    ensure => "RPM-GPG-KEY-rpmfusion-nonfree-fedora-${operatingsystemrelease}-primary",
    require => File['nonfree-key']
  }

}
