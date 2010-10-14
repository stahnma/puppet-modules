# Class yumclient::fedora::rpmfusion::free
# 
# Parameters:
#   None
#
# Actions:
#   Setup the free repo form rpmfusion
#
# Reqiures:
#   None
#
# Sample Usage:
#  include yumclient::fedora::rpmfusion::free
#
class yumclient::fedora::rpmfusion::free { 
  # rpmfusion-free repos
  yumrepo { 'rpmfusion-free':
    enabled => '1',
    gpgcheck => '1',
    metadata_expire => '7d',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-$releasever-$basearch',
    descr => 'RPM Fusion for Fedora $releasever - Free',
    mirrorlist => 'http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-$releasever&arch=$basearch',
    proxy => $proxy,
  }

  yumrepo { 'rpmfusion-free-debuginfo':
    enabled => '0',
    gpgcheck => '1',
    metadata_expire => '7d',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-$releasever-$basearch',
    descr => 'RPM Fusion for Fedora $releasever - Free - Debug',
    mirrorlist => 'http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-debug-$releasever&arch=$basearch',
    proxy => $proxy,
  }

  yumrepo { 'rpmfusion-free-source':
    enabled => '0',
    gpgcheck => '1',
    metadata_expire => '7d',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-$releasever-$basearch',
    descr => 'RPM Fusion for Fedora $releasever - Free - Source',
    mirrorlist => 'http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-source-$releasever&arch=$basearch',
    proxy => $proxy,
  }

  # rpmfusion-free-updates repos
  yumrepo { 'rpmfusion-free-updates':
    enabled => '1',
    gpgcheck => '1',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-$releasever-$basearch',
    descr => 'RPM Fusion for Fedora $releasever - Free - Updates',
    mirrorlist => 'http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-released-$releasever&arch=$basearch',
    proxy => $proxy,
  }

  yumrepo { 'rpmfusion-free-updates-debuginfo':
    enabled => '0',
    gpgcheck => '1',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-$releasever-$basearch',
    descr => 'RPM Fusion for Fedora $releasever - Free - Updates Debug',
    mirrorlist => 'http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-released-debug-$releasever&arch=$basearch',
    proxy => $proxy,
  }

  yumrepo { 'rpmfusion-free-updates-source':
    enabled => '0',
    gpgcheck => '1',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-$releasever-$basearch',
    descr => 'RPM Fusion for Fedora $releasever - Free - Updates Source',
    mirrorlist => 'http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-released-source-$releasever&arch=$basearch',
    proxy => $proxy,
  }

  # rpmfusion-free-updates-testing
  yumrepo { 'rpmfusion-free-updates-testing':
    enabled => '0',
    gpgcheck => '1',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-$releasever-$basearch',
    descr => 'RPM Fusion for Fedora $releasever - Free - Test Updates',
    mirrorlist => 'http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-testing-$releasever&arch=$basearch',
    proxy => $proxy,
  }

  yumrepo { 'rpmfusion-free-updates-testing-debuginfo':
    enabled => '0',
    gpgcheck => '1',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-$releasever-$basearch',
    descr => 'RPM Fusion for Fedora $releasever - Free - Test Updates Debug',
    mirrorlist => 'http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-testing-debug-$releasever&arch=$basearch',
    proxy => $proxy,
  }

  yumrepo { 'rpmfusion-free-updates-testing-source':
    enabled => '0',
    gpgcheck => '1',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-$releasever-$basearch',
    descr => 'RPM Fusion for Fedora $releasever - Free - Test Updates Source',
    mirrorlist => 'http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-testing-source-$releasever&arch=$basearch',
    proxy => $proxy,
  }


  file { 'free-key':
    path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-${lsbmajdistrelease}-primary",
    ensure => present,
    source => "puppet:///modules/rpmfusion/RPM-GPG-KEY-rpmfusion-free-fedora-${lsbmajdistrelease}-primary",
    owner => root,
    group => root,
    mode => 644,
  } 

  file { 'RPM-GPG-KEY-rpmfusion-free-fedora':
    path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora",
    ensure => "RPM-GPG-KEY-rpmfusion-free-fedora-${lsbmajdistrelease}-primary",
    require => File['free-key']
  }

  file { 'RPM-GPG-KEY-rpmfusion-free-fedora-3-i386':
    path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-${lsbmajdistrelease}-i386",
    ensure => "RPM-GPG-KEY-rpmfusion-free-fedora-${lsbmajdistrelease}-primary",
    require => File['free-key']
  }

  file { "RPM-GPG-KEY-rpmfusion-free-fedora-${lsbmajdistrelease}-ppc":
    path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-${lsbmajdistrelease}-ppc",
    ensure => "RPM-GPG-KEY-rpmfusion-free-fedora-${lsbmajdistrelease}-primary",
    require => File['free-key']
  }

  file { "RPM-GPG-KEY-rpmfusion-free-fedora-${lsbmajdistrelease}-ppc64":
    path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-${lsbmajdistrelease}-ppc64",
    ensure => "RPM-GPG-KEY-rpmfusion-free-fedora-${lsbmajdistrelease}-primary",
    require => File['free-key']
  }

  file { "RPM-GPG-KEY-rpmfusion-free-fedora-${lsbmajdistrelease}-x86_64":
    path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-${lsbmajdistrelease}-x86_64",
    ensure => "RPM-GPG-KEY-rpmfusion-free-fedora-${lsbmajdistrelease}-primary",
    require => File['free-key']
  }

  yumclient::rpm_gpg_key{ "rpmfusion-free-${lsbmajdistrelease}":
     path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-${lsbmajdistrelease}-primary",
  }
  
}
