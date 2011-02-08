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
} 

