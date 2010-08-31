class basic::packages {
  package { "rubygem-rake":
    ensure => installed,
  } 
 
  package { "vim-enhanced":
    ensure => installed,
  }

  package { "bind-utils":
    ensure => installed,
  }
 
  package { "keychain": 
    ensure => installed,
  }
   
  package { "bash-completion":
    ensure => installed,
  }

  package { "strace": 
    ensure => installed,
  }

  package { "openldap-clients":
    ensure => installed,
  }

  # probably things like network manager, bluetooth, wireless tools, etc
  $pkgs_to_remove_on_servers = [ wpa_supplicant ] 
}
