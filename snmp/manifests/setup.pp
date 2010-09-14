class snmp::setup { 
  # snmpwalk -v 2c -c public localhost

  #TODO setup configuration file with variables for comm string, etc
  $snmps = [ 'net-snmp-utils', 'net-snmp' ] 

  # Install packages
  package { $snmps: 
    ensure => installed,
  }

  # Start the service
  service { "snmpd":
    ensure => running, 
    enable => true, 
    hasstatus => true, 
    require  => Package[$snmps],
  }

  # Open firewall for snmpd
  exec { "iptables-snmp-open":
    command => "/sbin/iptables -A INPUT -p udp --dport 161 -j ACCEPT; /etc/init.d/iptables save", 
    unless =>  "/etc/init.d/iptables status | egrep  'udp dpt:161' ",
    require => Service['snmpd'],
    
  }

}
