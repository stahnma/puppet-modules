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
}
