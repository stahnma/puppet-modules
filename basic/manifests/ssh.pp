class basic::ssh {
  service { 'sshd': 
    ensure => running,
    enable => true, 
  } 
}
