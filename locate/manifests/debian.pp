# Class: locate::debian
#
# Class ensures and configures the locate/updatedb setup for debian 
# 
# Parameters:
#   None
#
# Actions:
#   Installs package, puts files in /etc/cron.daily and /etc/updatedb.conf
#
# Requires:
#   Requires a working cron setup with /etc/cron.daily, but the package manager 
#     should handle that
#
# Note: 
#    Files for debian and centos not all that different.  It may be possible to combine
#      the classes, files and modules.
#
# Sample Usage:
#   include 'locate'
#
class locate::debian { 
  package { 'mlocate':
    ensure => 'installed',
  }

  file { '/etc/cron.daily/mlocate':
    source => 'puppet:///modules/locate/mlocate',
    ensure => present,
    require => Package['mlocate'],
    owner => root,
    group => root,
    mode => 755, 
  } 

  file { '/etc/updatedb.conf':
    source => 'puppet:///modules/locate/updatedb.conf_debian',
    ensure => present,
    require => Package['mlocate'],
    owner => root,
    group => root,
    mode => 644, 
  }
}
