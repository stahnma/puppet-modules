class vmware-tools {
  $pkgs = [ 'perl-devel', 'kernel-headers', 'kernel-devel' ] 
 
  package { $pkgs:
    ensure => installed,
  }
}
