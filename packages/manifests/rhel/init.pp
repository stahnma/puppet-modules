# Package installation and control

class packages::rhel
{ 
  $everyWherePkgs = [ 'vim-enhanced', 'yum-utils', 'git' , 'strace' , \
    'nmap', 'wget', 'bind-utils', 'bash-completion' , 'ruby-ldap' , 'epel-release']
  package { $everyWherePkgs: ensure => installed }  
  
   if $runlevel == 3 { 
     include "packages::$rl" 
   } 
}
