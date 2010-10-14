

class yumclient { 
  # Be sure to set this if you need it. 
  # Setting to 'absent' will fall back to the yum.conf
  # Setting to a value will be used for all yum-repos currently 

  $proxy = 'absent'
  
  case $operatingsystem { 
    fedora:  { include 'yumclient::fedora' }
    default: { include 'yumclient::el' } # Assumes default is rhel/centos
  }

define rpm_gpg_key($path) { 
   # Given the path to a key, see if it is imported
   # if not, import it
   exec {  "import-$name":
     path => "/bin:/usr/bin:/sbin:/usr/sbin",
     command => "rpm --import $path",
     unless => "rpm -q gpg-pubkey-`$(echo $(gpg --throw-keyids < $path) | cut --characters=11-18 | tr [A-Z] [a-z])`",
     require => File[$path], 
   } 
}

}
