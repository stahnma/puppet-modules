# Setup a very simple /etc/resolv.conf

class resolv { 
  file { "/etc/resolv.conf":
    owner => root,
    group => root,
    mode =>  0644, 
    content => template('resolv/resolv.erb')
  }
} 
