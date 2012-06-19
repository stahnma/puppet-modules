# Class yumclient::el::centos
# 
# Parameters:
#   None
#
# Actions:
#   Configure the proper repositories and import GPG keys
#
# Reqiures:
#   None
#
# Sample Usage:
#  include yumclient::el::centos
#
class yumclient::el::centos {

  yumrepo { 'base':
    gpgcheck => '1',
    gpgkey => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$lsbmajdistrelease",
    descr => 'CentOS-$releasever - Base',
    mirrorlist => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os'
  }

  yumrepo { 'updates':
    gpgcheck => '1',
    gpgkey => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$lsbmajdistrelease",
    descr => 'CentOS-$releasever - Updates',
    mirrorlist => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=updates'
  }

  yumrepo { 'addons':
    gpgcheck => '1',
    gpgkey => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$lsbmajdistrelease",
    descr => 'CentOS-$releasever - Addons',
    mirrorlist => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=addons'
  }

  yumrepo { 'extras':
    gpgcheck => '1',
    gpgkey => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$lsbmajdistrelease",
    descr => 'CentOS-$releasever - Extras',
    mirrorlist => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=extras'
  }

  yumrepo { 'centosplus':
    gpgcheck => '1',
    gpgkey => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$lsbmajdistrelease",
    descr => 'CentOS-$releasever - Plus',
    mirrorlist => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=centosplus',
    enabled => '0'
  }

  yumrepo { 'contrib':
    gpgcheck => '1',
    gpgkey => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$lsbmajdistrelease",
    descr => 'CentOS-$releasever - Contrib',
    mirrorlist => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=contrib',
    enabled => '0'
  }

  file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$lsbmajdistrelease":
    ensure => present,
    owner => 'root',
    group => 'root',
    mode => '644',
    source => "puppet:///modules/yumclient/RPM-GPG-KEY-CentOS-$lsbmajdistrelease"
  }

   yumclient::rpm_gpg_key{ "CentOS-$lsbmajdistrelease":
      path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$lsbmajdistrelease"
   }
}
