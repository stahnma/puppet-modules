class packages::rhel::epel { 
  exec { "setup-epel":  
    unless => "/bin/rpm -q epel-release",
    command => "/bin/rpm -U http://mirrors.xmission.com/fedora/epel/5Server/i386/epel-release-5-3.noarch.rpm"
  }

  package { "epel-release":
     ensure => latest,
  }
}
