# Package installation and control
class packages::rhel::server {
  include packages::rhel::server
  include packages::rhel::epel
  $serverPkgs = [ 'curl', 'httpd', 'irssi',  'logrotate', 'net-snmp-utils', 'screen'  ]
  Package {
    require => Class["packages::rhel::epel"],
  }
  package { $serverPkgs:
    ensure => installed,
  }
}
