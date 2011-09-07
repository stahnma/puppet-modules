# This class just sets up /etc/hosts
# Class: applications:lssm
# Author: Michael Stahnke
# Copyright: (c) 2010, 2011
# License: BSD
#
# Parameters:
#   None
#
# Actions:
#  Sets up /etc/hosts
#    localhost
#    puppet server
#    fqdn
#
# Requires:
#  - Nothing
#
# Sample Usage:
#
#  include 'hosts'
#
class hosts {
  file { "/etc/hosts":
    ensure => present,
  }
  host { 'localhost.localdomain':
    ip => '127.0.0.1',
    host_aliases => ['localhost'],
    ensure => 'present',
    target => '/etc/hosts'
  }
  host { 'localhost6.localdomain6':
    ip => '::1',
    host_aliases => ['localhost6'],
    ensure => 'present',
    target => '/etc/hosts'
  }
  host { $fqdn:
    ip => $ipaddress,
    host_aliases => [$hostname],
    ensure => 'present',
    target => '/etc/hosts'
  }

  resources { 'host':
     purge => true
  }
}
