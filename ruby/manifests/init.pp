

class ruby { 
  $pkgs = [ 'ruby', 'rubygems', 'rubygem-rake', 'ruby-devel', 'ruby-ldap', 'rubygem-shotgun', 'rubygem-sinatra', 'ruby-ri' ] 

  package { $pkgs : 
    ensure => installed,
  }
}
