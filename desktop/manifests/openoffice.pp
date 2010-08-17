class desktop::openoffice { 
  $pkgs = [ 'openoffice.org-calc', 'openoffice.org-writer', 'openoffice.org-impress' ] 
  package { $pkgs: 
    ensure => installed,
  }

}
