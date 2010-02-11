# Package installation and control
class packages::rhel::server
{ 
  $serverPkgs = [ 'curl', 'httpd', 'irssi',  'logrotate', 'net-snmp-utils'  ] 
  package { $serverPkgs: ensure => installed }  
}
