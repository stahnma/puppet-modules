# Client portions
class puppetclient { 
  service { "puppet":
      ensure => true,
      enable => true,
      hasstatus => true,
      hasrestart => true,
  }

  # definition that sets up /etc/sysconfig/puppet
  file { "/etc/sysconfig/puppet": 
    owner => root,
    group => root,
    content => template('puppetclient/sysconfig-puppet.erb')
  }

  exec { "/etc/init.d/puppet stop; /etc/init.d/puppet start":
    subscribe => File["/etc/sysconfig/puppet"],
    refreshonly => true
  }
}
