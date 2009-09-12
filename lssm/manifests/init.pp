# Class: applications:lssm
#
# Parameters:
#   None
#
# Actions:
#  Install the lssm package which requires Apache. 
#  Deploy a good configuration for lssm
#  Configure the Apache server for a URI
#  Restart Apache2
#  Ensure Apache2 starts on boot
#
# Requires:
#  - Package["lssm"]
#
# Sample Usage:
# 
class applications::lssm {
  $lssmPkgs = [ 'lssm' ] 
  package { $lssmPkgs: ensure => installed }
 
  file {"configuration.yaml":
    path => "/etc/lssm/configuration.yaml",
    ensure => file,
    mode   => "0644",
    owner  => "root",
    group  => "root",
    source => "puppet:///lssm/configuration.yaml",
    require => Package[ $lssmPkgs ]
  }

  file {"lssm-apache.conf":
    path => "/etc/apache2/conf.d/lssm-apache.conf",
    ensure => file,
    mode =>   "0644",
    owner  => "root",
    group  => "root",
    source => "puppet:///lssm/lssm-apache.conf",
    require => File[ "configuration.yaml" ],
  }
  
  package { "apache2":
        ensure => present
  }

  service { "apache2":
    ensure => running,
    enable => true,
    hasstatus => true,
    status => "/etc/init.d/apache2/status",
    require => Package['apache2']
  } 
 
}
