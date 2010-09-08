

class ruby { 
  $pkgs = [ 'ruby', 'rubygems', 'rubygem-rake', 'ruby-devel', 'ruby-ldap' ] 

  package { $pkgs : 
    ensure => installed,
  }
}
