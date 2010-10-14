class yumclient::el::rhn { 
  notice("RHN should be configured and setup.")
  # Also configure the default PKI 
  File {
     owner => 'root',
     group => 'root',
     mode => '644',
  }

  file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release":
    ensure => present,
    source => "puppet:///modules/yumclient/RPM-GPG-KEY-redhat-release-$lsbmajdistrelease",
  }

 file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-beta":
    ensure => present,
    source => "puppet:///modules/yumclient/RPM-GPG-KEY-redhat-beta-$lsbmajdistrelease", 
  }

  file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-rhx":
    ensure => present,
    source => "puppet:///modules/yumclient/RPM-GPG-KEY-redhat-rhx", 
  }

  file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-auxiliary":
    ensure => present,
    source => "puppet:///modules/yumclient/RPM-GPG-KEY-redhat-auxiliary", 
  }
 
 file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-former":
    ensure => present,
    source => "puppet:///modules/yumclient/RPM-GPG-KEY-redhat-former", 
  }
  
  yumclient::rpm_gpg_key{ "redhat-release-$lsbmajdistrelease":
     path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release",
  }

  yumclient::rpm_gpg_key{ "redhat-beta-$lsbmajdisrelease":
     path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-beta",
  }

  yumclient::rpm_gpg_key{ "redhat-rhx":
     path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-rhx",
  }

  yumclient::rpm_gpg_key{ "redhat-auxiliary":
     path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-auxiliary",
  }

  # Leaving this out as it should not be needed
  #yumclient::rpm_gpg_key{ "redhat-former":
  #   path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-former",
  #}

  
  
 



}
