# Class yumclient::fedora::fedora
# 
# Parameters:
#   None
#
# Actions:
#   Setup Fedora primary repos and import GPG keys
#
# Reqiures:
#   None
#
# Sample Usage:
#  include yumclient::fedora
#
class yumclient::fedora::fedora { 

  yumrepo { 'fedora':
    gpgcheck => '1',
    metadata_expire => '7d',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch',
    descr => 'Fedora $releasever - $basearch',
    mirrorlist => 'https://mirrors.fedoraproject.org/metalink?repo=fedora-$releasever&arch=$basearch',
    failovermethod => 'priority',
    enabled => '1',
    proxy => $proxy,
  }

  yumrepo { 'updates':
    gpgcheck => '1',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch',
    descr => 'Fedora $releasever - $basearch - Updates',
    mirrorlist => 'https://mirrors.fedoraproject.org/metalink?repo=updates-released-f$releasever&arch=$basearch',
    failovermethod => 'priority',
    enabled => '1',
    proxy => $proxy,
  }

  yumrepo { 'updates-testing':
    gpgcheck => '1',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch',
    descr => 'Fedora $releasever - $basearch - Test Updates',
    mirrorlist => 'https://mirrors.fedoraproject.org/metalink?repo=updates-testing-f$releasever&arch=$basearch',
    failovermethod => 'priority',
    enabled => '0',
    proxy => $proxy,
  }

  yumrepo { 'fedora-debuginfo':
    gpgcheck => '1',
    metadata_expire => '7d',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch',
    descr => 'Fedora $releasever - $basearch - Debug',
    mirrorlist => 'https://mirrors.fedoraproject.org/metalink?repo=fedora-debug-$releasever&arch=$basearch',
    failovermethod => 'priority',
    enabled => '0',
    proxy => $proxy,
  }

  yumrepo { 'updates-debuginfo':
    gpgcheck => '1',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch',
    descr => 'Fedora $releasever - $basearch - Updates - Debug',
    mirrorlist => 'https://mirrors.fedoraproject.org/metalink?repo=updates-released-debug-f$releasever&arch=$basearch',
    failovermethod => 'priority',
    enabled => '0',
    proxy => $proxy,
  }
  
  yumrepo { 'updates-testing-debuginfo':
    gpgcheck => '1',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch',
    descr => 'Fedora $releasever - $basearch - Test Updates Debug',
    mirrorlist => 'https://mirrors.fedoraproject.org/metalink?repo=updates-testing-debug-f$releasever&arch=$basearch',
    failovermethod => 'priority',
    enabled => '0',
    proxy => $proxy,
  }
 
  yumrepo { 'fedora-source':
    gpgcheck => '1',
    metadata_expire => '7d',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch',
    descr => 'Fedora $releasever - Source',
    mirrorlist => 'https://mirrors.fedoraproject.org/metalink?repo=fedora-source-$releasever&arch=$basearch',
    failovermethod => 'priority',
    enabled => '0',
    proxy => $proxy,
  }

  yumrepo { 'updates-source':
    gpgcheck => '1',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch',
    descr => 'Fedora $releasever - Updates Source',
    mirrorlist => 'https://mirrors.fedoraproject.org/metalink?repo=updates-released-source-f$releasever&arch=$basearch',
    failovermethod => 'priority',
    enabled => '0',
    proxy => $proxy,
  }

  yumrepo { 'updates-testing-source':
    mirrorlist => 'https://mirrors.fedoraproject.org/metalink?repo=updates-testing-source-f$releasever&arch=$basearch',
    failovermethod => 'priority',
    enabled => '0',
    gpgcheck => '1',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch',
    descr => 'Fedora $releasever - Test Updates Source',
    proxy => $proxy,
  }
  
  File { 
    owner => "root",
    group => "root", 
    mode => "644",
    ensure => present,
  }

  file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$lsbmajdistrelease-primary":
    source => "puppet:///modules/yumclient/RPM-GPG-KEY-fedora-$lsbmajdistrelease-primary"
  }

  file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$architecture":
     ensure => "RPM-GPG-KEY-fedora-$lsbmajdistrelease-primary",
     require => File["/etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$lsbmajdistrelease-primary"],
  }

  yumclient::rpm_gpg_key{ "fedora-$lsbmajdistrelease":
     path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$lsbmajdistrelease-primary" 
  }

} 
 
