# Setup Virtualization Packages

class virtualization { 
  $pkgs = [ 'virt-top', 'ruby-libvirt', 'libvirt', 'qemu-kvm', 'qemu-kvm-tools'   ] 
  package { $pkgs: 
    ensure => installed,
  }

  service { "libvirtd": 
    ensure => running,
    enable => true,
    require => Package[$pkgs],
  }

  service { "libvirt-guests": 
    ensure => running,
    enable => true,
    require => Package[$pkgs],
  }
}
