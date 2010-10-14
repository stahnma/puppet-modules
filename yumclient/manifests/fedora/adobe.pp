# Class yumclient::fedora::adobe
# 
# Parameters:
#   None
#
# Actions:
#   Setup the adobe repo (flash/reader) for linux
#
# Reqiures:
#   None
# 
# Issues:
#   Adobe only offers i386 repo at this time.
#
# Sample Usage:
#  include yumclient::fedora::adobe
#
class yumclient::fedora::adobe { 

  yumrepo { 'adobe':
    gpgcheck => '1',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux',
    descr => 'Adobe Systems Incorporated',
    baseurl => 'http://linuxdownload.adobe.com/linux/i386/',
    enabled => '1',
    proxy => $proxy,
  }
  
  file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux":
    ensure => present,
    owner => 'root',
    group => 'root',
    mode => '644',
    source => "puppet:///modules/yumclient/RPM-GPG-KEY-adobe-linux",
  } 

  yumclient::rpm_gpg_key{ "adobe-linux":
    path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux"
  }

}
