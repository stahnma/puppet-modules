# Ensure ntpd is installed and running

class ntp
{

  # EL 5 and less have no seperate ntpdate package
  $ntpPkgs =  $operatingsystem ? {
      Fedora  => [ 'ntp', 'ntpdate' ],
      default => [ 'ntp' ]
  }
  package { $ntpPkgs: ensure => installed,  } 
  
  file { "ntpconf":
        name => "/etc/ntp.conf",
        owner => root,
        group => root,
        mode => 644,
        source => "puppet:///modules/ntp/ntp.conf"
  }

  service { "ntpd":
        subscribe => File["ntpconf"],
        ensure => running,
        enable => true,
        hasstatus => true,
        hasrestart => true,
  }
}
