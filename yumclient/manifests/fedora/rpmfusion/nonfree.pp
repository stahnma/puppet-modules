# Class yumclient::fedora::rpmfusion::nonfree
# 
# Parameters:
#   None
#
# Actions:
#   Setup the nonfree repo form rpmfusion
#
# Reqiures:
#   yumclient::fedora::rpmfusion::free
#
# Sample Usage:
#  include yumclient::fedora::rpmfusion::nonfree
#
class yumclient::fedora::rpmfusion::nonfree { 
  include 'yumclient::fedora::rpmfusion::free'
  
  # Basic rpmfusion-nonfree
  yumrepo { 'rpmfusion-nonfree':
    enabled => '1',
    gpgcheck => '1',
    metadata_expire => '7d',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever-$basearch',
    descr => 'RPM Fusion for Fedora $releasever - Nonfree',
    mirrorlist => 'http://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-$releasever&arch=$basearch',
    proxy => $proxy,
    require => Class['yumclient::fedora::rpmfusion::free'],
  }

  yumrepo { 'rpmfusion-nonfree-debuginfo':
    enabled => '0',
    gpgcheck => '1',
    metadata_expire => '7d',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever-$basearch',
    descr => 'RPM Fusion for Fedora $releasever - Nonfree - Debug',
    mirrorlist => 'http://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-debug-$releasever&arch=$basearch',
    proxy => $proxy,
  }

  yumrepo { 'rpmfusion-nonfree-source':
    enabled => '0',
    gpgcheck => '1',
    metadata_expire => '7d',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever-$basearch',
    descr => 'RPM Fusion for Fedora $releasever - Nonfree - Source',
    mirrorlist => 'http://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-source-$releasever&arch=$basearch',
    proxy => $proxy,
  }
  
  # rpmfusion-nonfree-updates repos
  yumrepo { 'rpmfusion-nonfree-updates':
    enabled => '1',
    gpgcheck => '1',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever-$basearch',
    descr => 'RPM Fusion for Fedora $releasever - Nonfree - Updates',
    mirrorlist => 'http://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-updates-released-$releasever&arch=$basearch',
    proxy => $proxy,
  }

  yumrepo { 'rpmfusion-nonfree-updates-debuginfo':
    enabled => '0',
    gpgcheck => '1',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever-$basearch',
    descr => 'RPM Fusion for Fedora $releasever - Nonfree - Updates Debug',
    mirrorlist => 'http://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-updates-released-debug-$releasever&arch=$basearch',
    proxy => $proxy,
  }

  yumrepo { 'rpmfusion-nonfree-updates-source':
    enabled => '0',
    gpgcheck => '1',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever-$basearch',
    descr => 'RPM Fusion for Fedora $releasever - Nonfree - Updates Source',
    mirrorlist => 'http://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-updates-released-source-$releasever&arch=$basearch',
    proxy => $proxy,
  }


  # Rpmfusion-nonfree-updates-testing repos
  yumrepo { 'rpmfusion-nonfree-updates-testing':
    enabled => '0',
    gpgcheck => '1',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever-$basearch',
    descr => 'RPM Fusion for Fedora $releasever - Nonfree - Test Updates',
    mirrorlist => 'http://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-updates-testing-$releasever&arch=$basearch',
    proxy => $proxy,
  }

  yumrepo { 'rpmfusion-nonfree-updates-testing-debuginfo':
    enabled => '0',
    gpgcheck => '1',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever-$basearch',
    descr => 'RPM Fusion for Fedora $releasever - Nonfree - Test Updates Debug',
    mirrorlist => 'http://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-updates-testing-debug-$releasever&arch=$basearch',
    proxy => $proxy,
  }

  yumrepo { 'rpmfusion-nonfree-updates-testing-source':
    enabled => '0',
    gpgcheck => '1',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever-$basearch',
    descr => 'RPM Fusion for Fedora $releasever - Nonfree - Test Updates Source',
    mirrorlist => 'http://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-updates-testing-source-$releasever&arch=$basearch',
    proxy => $proxy,
  }

 
  file { 'nonfree-key':
    path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-${lsbmajdistrelease}-primary",
    ensure => present,
    source => "puppet:///modules/rpmfusion/RPM-GPG-KEY-rpmfusion-nonfree-fedora-${lsbmajdistrelease}-primary",
    owner => root,
    group => root,
    mode => 644,
  } 

  file { 'RPM-GPG-KEY-rpmfusion-nonfree-fedora':
    path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora",
    ensure => "RPM-GPG-KEY-rpmfusion-nonfree-fedora-${lsbmajdistrelease}-primary",
    require => File['nonfree-key']
  }

  file { 'RPM-GPG-KEY-rpmfusion-nonfree-fedora-3-i386':
    path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-${lsbmajdistrelease}-i386",
    ensure => "RPM-GPG-KEY-rpmfusion-nonfree-fedora-${lsbmajdistrelease}-primary",
    require => File['nonfree-key']
  }

  file { "RPM-GPG-KEY-rpmfusion-nonfree-fedora-${lsbmajdistrelease}-ppc":
    path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-${lsbmajdistrelease}-ppc",
    ensure => "RPM-GPG-KEY-rpmfusion-nonfree-fedora-${lsbmajdistrelease}-primary",
    require => File['nonfree-key']
  }

  file { "RPM-GPG-KEY-rpmfusion-nonfree-fedora-${lsbmajdistrelease}-ppc64":
    path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-${lsbmajdistrelease}-ppc64",
    ensure => "RPM-GPG-KEY-rpmfusion-nonfree-fedora-${lsbmajdistrelease}-primary",
    require => File['nonfree-key']
  }

  file { "RPM-GPG-KEY-rpmfusion-nonfree-fedora-${lsbmajdistrelease}-x86_64":
    path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-${lsbmajdistrelease}-x86_64",
    ensure => "RPM-GPG-KEY-rpmfusion-nonfree-fedora-${lsbmajdistrelease}-primary",
    require => File['nonfree-key']
  }

  yumclient::rpm_gpg_key{ "rpmfusion-nonfree-${lsbmajdistrelease}":
    path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-${lsbmajdistrelease}-primary",
  }

}
