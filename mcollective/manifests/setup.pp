class mcollective::setup { 
  $mcpkgs = [ 'rubygem-stomp' ] 
  
  package { $mcpkgs: 
    ensure => installed,
  }

}
