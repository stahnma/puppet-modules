# Setup a very simple /etc/resolv.conf

class resolver { 
  file { "/etc/resolv.conf":
    owner => root,
    group => root,
    mode =>  0644, 
    content => template('resolv/resolv.erb')
  }
} 
