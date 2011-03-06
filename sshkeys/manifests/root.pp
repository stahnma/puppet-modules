# Class: sshkeys::root
# 
# Simple class/module to deploy public ssh keys for root user
# 
# Actions: 
#  Installs contents for root/authorized_keys into root/.ssh/authorized_keys
#
# Files:
#  An authorized_key file is distributed 
#
# Requires:
#  There is an implicit requires on an OpenSSH server, but it is not specified in this class.
#
# Sample usage:
#  include 'sshkeys::root'
#
class sshkeys::root { 
  file { "/root/.ssh":
       ensure => directory,
       owner => root,
       group => root,
       mode => 700
  }

  file { "/root/.ssh/authorized_keys":
       owner => root,
       group => root,
       mode => 400,
       source => "puppet:///modules/sshkeys/root/authorized_keys"
  }
}
