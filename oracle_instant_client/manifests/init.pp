# Class: oracle_instant_client
#
# Class installs the Oracle instantclient, including the ldconfig setup.
# 
# Parameters:
#   None
#
# Actions:
#   Installs package, sets up /etc/oracle, runs ldconfig
#
# Requires:
#   - Custom package oracle-instantclient to be in an available package repo
#      > See http://github.com/stahnma/stahnkage-srpms for more information
#
# Sample Usage:
#   include oracle_instant_client
#
class oracle_instant_client {
  # Note that oracle-instantclient is a site-specifc package.
  # We built a package that requires other oracle-instantclient-* packages
  # and also provides libclntsh.so since one of the oracle rpms
  # carelessly forgets to provide that.

  # need to rebuild this package or include -odbc and -jdbc 
  package { "oracle-instantclient":
    ensure => present,
  } 

  # Create a directory to hold configuration
  file { "/etc/oracle": 
    ensure => directory,
    require => Package['oracle-instantclient'],
  }

  # put the right things in ld.so.conf.d
  $cont =  $architecture ? { 
    x86_64 => "/usr/lib/oracle/11.2/client64/lib\n", 
    i386 =>  "/usr/lib/oracle/11.2/client/lib\n",
    default => undef,
  }

  exec{ "/sbin/ldconfig":
    refreshonly => true,
    subscribe => File['/etc/ld.so.conf.d/oracle-instant.conf'],
  }

  file { "/etc/ld.so.conf.d/oracle-instant.conf":
    ensure => present,
    content => $cont,
    notify => Exec['/sbin/ldconfig'],
    require => Package['oracle-instantclient'],
  } 

  # Export your default TNS directory 
  file { "/etc/oracle/env.sh": 
    content => "export TNS_ADMIN=/etc/oracle\n",
    require => Package['oracle-instantclient'],
  } 
  
  # Create a symlink for this file in /etc/profile.d 
  file { "/etc/profile.d/oracle.sh": 
    ensure => "/etc/oracle/env.sh"
  }
}
