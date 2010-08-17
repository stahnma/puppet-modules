

class ruby { 
  $pkgs = [ 'ruby', 'rubygems', 'rubygem-rake', 'ruby-devel' ] 

  package { $pkgs : 
    ensure => installed,
  }
}
