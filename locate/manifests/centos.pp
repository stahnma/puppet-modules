# Class: locate::centos
#
# Class ensures and configures the locate/updatedb setup for centos/fedora
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
class locate::centos { 
  package { 'mlocate':
    ensure => 'installed',
  }

  file { '/etc/cron.daily/mlocate.cron':
    source => 'puppet:///modules/locate/mlocate.cron',
    ensure => present,
    require => Package['mlocate'],
    owner => root,
    group => root,
    mode => 755, 
  } 

  file { '/etc/updatedb.conf':
    source => 'puppet:///modules/locate/updatedb.conf_centos',
    ensure => present,
    require => Package['mlocate'],
    owner => root,
    group => root,
    mode => 644, 
  }

}
