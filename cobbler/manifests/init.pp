class cobbler { 
  # Install Package
  include cobbler::packages
}

class cobbler::packages { 
  $cobbler_packages = [ "cobbler", "koan" ]
  package { $cobbler_packages: 
    ensure => "installed",
  }
} 

class cobbler::setup { }

class cobbler::web {}


