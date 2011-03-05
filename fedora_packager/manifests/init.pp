

class fedora_packager { 
  $fedpkgs = [ 'fedora-packager', 'gcc', 'automake', 'make', 'autoconf' ] 
  package { $fedpkgs: ensure => installed } 

  file { "/usr/local/bin/cl":
    ensure => present,
    mode  => 0755,
    owner => 'root',
    group => 'root',
    source => 'puppet:///modules/fedora_packager/cl',
  } 
}
