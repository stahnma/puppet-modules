# Enable rpmfusion

class rpmfusion::enabled {
 
  @package { "wget":
    ensure => installed,
  }

  exec { "install-rpm-fusion-free":
    path => "/bin:/usr/bin:/usr/sbin:/sbin",
    unless => "rpm -q rpmfusion-free-release",
    cwd => "/tmp",
    command => "wget http://download1.rpmfusion.org/free/fedora/releases/13/Everything/i386/os/rpmfusion-free-release-13-2.noarch.rpm  && rpm -UVh rpmfusion-free-release*rpm"
 
  }

  exec { "install-rpm-fusion-nonfree":
    path => "/bin:/usr/bin:/usr/sbin:/sbin",
    unless => "rpm -q rpmfusion-nonfree-release",
    cwd => "/tmp",
    command => "wget http://download1.rpmfusion.org/nonfree/fedora/releases/13/Everything/i386/os/rpmfusion-nonfree-release-13-2.noarch.rpm && rpm -Uvh rpmfusion-nonfree-release*rpm"
  }

  realize(Package['wget'])
} 
