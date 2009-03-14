# Simple module to deploy public ssh key
# to root user
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
       source => "puppet:///sshkeys/root/authorized_keys"
  }
