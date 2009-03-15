# Client portions
# need to distribute /etc/sysconfig/puppet
# needs to ensure puppetd is chkconfiged on
# needs to ensure that puppetd is running
# should check to ensure that puppet is the latest?

  $pserver = "hart.stahnkage.com"
# should probably use a template to specify the server???
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
