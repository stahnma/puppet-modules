class nfs {
  $pkgs = [ 'nfs-utils' ] 
  package { $pkgs: 
    ensure => installed,
  }

  service { "rpcbind":
    ensure => running,
    enable => true,
    require => Package[$pkgs],
  }
 
  service { "nfs":
    ensure => running,
    enable => true,
    require => [ Package[$pkgs], Service['rpcbind'] ],
  }
}
