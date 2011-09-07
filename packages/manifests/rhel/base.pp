# Package installation and control
class packages::rhel::base  {
  if $epel_installed == false {
    include packages::rhel::epel
  }

  $everyWherePkgs = [ 'vim-enhanced', 'yum-utils', 'git' , 'strace' ,
     'nmap', 'wget', 'bind-utils', 'bash-completion' , 'ruby-ldap' ]

  package {  $everyWherePkgs:
     ensure => installed,
  }
  if $runlevel == 3 {
    include "packages::rhel::server"
  }
}
