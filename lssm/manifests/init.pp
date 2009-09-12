# Class: applications:lssm
# Michael Stahnke (c) 2009
#
# Parameters:
#   None
#
# Actions:
#  Install the lssm package which requires Apache. 
#  Deploy a good configuration for lssm
#  Configure the Apache server for a URI
#  Restart Apache
#  Ensure Apache starts on boot
#
# Requires:
#  - Package["lssm"]
#
# Sample Usage:
# 
#  include 'applications::lssm'
#
#
class applications::lssm {
  package { "lssm" : ensure => installed }
 
  file {"configuration.yaml":
    path => "/etc/lssm/configuration.yaml",
    ensure => file,
    mode   => "0644",
    owner  => "root",
    group  => "root",
    # Real Deployment
    source => "puppet:///lssm/configuration.yaml",
    # For local testing
    #source => "/home/stahnma/puppet-modules/lssm/files/configuration.yaml",
    require => Package[ "lssm" ]
  }

  file {"lssm-apache.conf":
    path => $operatingsystem ? {
      debian =>  "/etc/apache2/conf.d/lssm-apache.conf",
      ubuntu =>  "/etc/apache2/conf.d/lssm-apache.conf",
      fedora =>  "/etc/http/conf.d/lssm-apache.conf",
      RedHat =>  "/etc/http/conf.d/lssm-apache.conf",
      CentOS =>  "/etc/http/conf.d/lssm-apache.conf",
      default =>  "/etc/http/conf.d/lssm-apache.conf",
    },
    ensure => file,
    mode =>   "0644",
    owner  => "root",
    group  => "root",
    # Real Deployment
    source => "puppet:///lssm/lssm-apache.conf",
    # For local testing
    #source => "/home/stahnma/puppet-modules/lssm/files/lssm-apache.conf",
    require => File[ "configuration.yaml" ],
  }
  
  package { "apache2": ensure => present }

  service { "apache":
    name => $operatingsystem ? {
      debian =>  "apache2",
      ubuntu =>  "apache2",
      fedora =>  "httpd",
      RedHat =>  "httpd",
      CentOS =>  "httpd",
      default =>  "httpd",
    },
    ensure => running,
    enable => true,
    hasstatus => true,
    status => "/etc/init.d/$name status",
    require => Package["apache"]
  } 
}
