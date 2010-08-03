

class rpmfusion::yum { 

  yumrepo{ "rpmfusion-free-puppet":
    enabled => 1 , 
    mirrorlist => 'http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-$releasever&arch=$basearch',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-$releasever-$basearch',
    gpgcheck => 1, 
    #baseurl => 'http://download1.rpmfusion.org/free/fedora/releases/$releasever/Everything/$basearch/os/',
    metadata_expire => 7d,
  }

  yumrepo{ "rpmfusion-free-debug":
    enabled => 1 , 
    mirrorlist => 'http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-$releasever&arch=$basearch',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-$releasever-$basearch',
    gpgcheck => 1, 
    #baseurl => 'http://download1.rpmfusion.org/free/fedora/releases/$releasever/Everything/$basearch/os/',
    metadata_expire => 7d,
  }

  yumrepo{ "rpmfusion-source":
  }

}
