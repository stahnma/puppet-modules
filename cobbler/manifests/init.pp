class cobbler { 
  $cobbler_packages = [ "cobbler", "koan", "cobbler-web" ]
  package { $cobbler_packages: 
    ensure => "installed",
    notify => Service['cobblerd', 'httpd'],
  }
 
  service {"cobblerd":
    enable => true,
    ensure => running, 
    require => Package[$cobbler_packages],
  }

  service {"httpd":
    ensure => running,
    enable => true,
    require => Service['cobblerd'],
  }

  file { "/etc/cobbler/settings":
    ensure => present,
    mode => 0644,
    owner => root,
    group => root,
    content => template('cobbler/settings.erb'), 
    notify => Service['cobblerd'],
  }

  service { "tftp": 
    enable => true, 
    require => Package[$cobbler_packages],
  }

  service { "rsync":
    enable => true,
    require => Package[$cobbler_packages],
  }

#  package { "debmirror":
#    ensure => installed,
#  }

  exec { "getloaders":
    command => 'cobbler get-loaders',
    path => [ "/usr/bin", "/usr/sbin", "/bin", "/sbin" ] ,
    unless => "test -f /var/lib/cobbler/loaders/yaboot ",
    require => Package[$cobbler_packages],
  }
     
   
  iptables { "open httpd":
    dport => "80",
    source => "0.0.0.0",
    destination => "0.0.0.0",
    jump => "ACCEPT",
    require => Service['httpd'],
  }

  iptables { "open tftp":
    dport => "69",
    source => "0.0.0.0",
    destination => "0.0.0.0",
    jump => "ACCEPT",
    require => Service['tftp'],
  }

  iptables { "open ssl":
    dport => "443",
    source => "0.0.0.0",
    destination => "0.0.0.0",
    jump => "ACCEPT",
    require => Service['httpd'],
  }

  iptables { "open 25151":
    dport => "25151",
    source => "0.0.0.0",
    destination => "0.0.0.0",
    jump => "ACCEPT",
    require => Package[$cobbler_packages],
  }

  file { "/etc/cobbler/modules.conf":
    owner => 'root',
    group => 'root',
    mode => 0774,
    ensure => present,
    content => template('cobbler/modules.conf.erb'),
    require => Package[$cobbler_packages],
    notify => Service['cobblerd'],
  }

}

