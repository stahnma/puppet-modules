# Setup Virtualization Packages

class virtualization { 
  $pkgs = [ 'virt-top', 'ruby-libvirt', 'libvirt', 'qemu-kvm', 'qemu-kvm-tools'   ] 
  package { $pkgs: 
    ensure => installed,
  }
}
