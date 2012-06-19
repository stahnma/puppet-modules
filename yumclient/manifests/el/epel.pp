# Class yumclient::el::epel
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
#  include yumclient::el::epel
#
class yumclient::el::epel {

  yumrepo { "epel-testing":
    baseurl => "http://download.fedora.redhat.com/pub/epel/testing/$lsbmajdistrelease/$architecture",
    proxy => "$proxy",
    failovermethod => "priority",
    enabled => "0",
    gpgcheck => "1",
    gpgkey => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-$lsbmajdistrelease",
    descr => "Extra Packages for Enterprise Linux $lsbmajdistrelease - Testing - $architecture "
  }

  yumrepo { "epel-testing-debuginfo":
    baseurl => "http://download.fedora.redhat.com/pub/epel/testing/$lsbmajdistrelease/$architecture/debug",
    failovermethod => "priority",
    proxy => "$proxy",
    enabled => "0",
    gpgcheck => "1",
    gpgkey => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-$lsbmajdistrelease",
    descr => "Extra Packages for Enterprise Linux $lsbmajdistrelease - Testing - $architecture - Debug"
  }

  yumrepo { "epel-testing-source":
    baseurl => "http://download.fedora.redhat.com/pub/epel/testing/$lsbmajdistrelease/SRPMS",
    failovermethod => "priority",
    proxy => "$proxy",
    enabled => "0",
    gpgcheck => "1",
    gpgkey => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-$lsbmajdistrelease",
    descr => "Extra Packages for Enterprise Linux $lsbmajdistrelease - Testing - $architecture - Source"
  }

  yumrepo { "epel":
    mirrorlist => "http://mirrors.fedoraproject.org/mirrorlist?repo=epel-$lsbmajdistrelease&arch=$architecture",
    proxy => "$proxy",
    failovermethod => "priority",
    enabled => "1",
    gpgcheck => "1",
    gpgkey => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-$lsbmajdistrelease",
    descr => "Extra Packages for Enterprise Linux $lsbmajdistrelease - $architecture"
  }

  yumrepo { "epel-debuginfo":
    mirrorlist => "http://mirrors.fedoraproject.org/mirrorlist?repo=epel-debug-$lsbmajdistrelease&arch=$architecture",
    proxy => "$proxy",
    failovermethod => "priority",
    enabled => "0",
    gpgcheck => "1",
    gpgkey => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-$lsbmajdistrelease",
    descr => "Extra Packages for Enterprise Linux $lsbmajdistrelease - $architecture - Debug"
  }

  yumrepo { "epel-source":
    mirrorlist => "http://mirrors.fedoraproject.org/mirrorlist?repo=epel-source-$lsbmajdistrelease&arch=$architecture",
    proxy => "$proxy",
    failovermethod => "priority",
    enabled => "0",
    gpgcheck => "1",
    gpgkey => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-$lsbmajdistrelease",
    descr => "Extra Packages for Enterprise Linux $lsbmajdistrelease - $architecture - Source"
  }

  file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-$lsbmajdistrelease":
    ensure => present,
    owner => 'root',
    group => 'root',
    mode => '644',
    source => "puppet:///modules/yumclient/RPM-GPG-KEY-EPEL-$lsbmajdistrelease",
  }

   yumclient::rpm_gpg_key{ "EPEL-$lsbmajdistrelease":
      path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-$lsbmajdistrelease"
   }

}
