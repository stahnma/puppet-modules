class packages::rhel::epel {

  if $epel_installed == 'false' {
      if $operatingsystemrelease =~ /5.x/ {
          $cmd = "/bin/rpm -U http://mirrors.xmission.com/fedora/epel/5Server/i386/epel-release-5-3.noarch.rpm"
      }
      else {
          $cmd = "/bin/rpm -U http://download.fedora.redhat.com/pub/epel/6/x86_64/epel-release-6-5.noarch.rpm"
      }

      exec { "setup-epel":
        unless => "/bin/rpm -q epel-release",
        command => $cmd,
        notify => Package[epel-release],
      }

      package { "epel-release":
         ensure => latest,
         require => [ Exec["setup-epel"] ],
      }
  }
  else {
    #epel is setup
  }
}
