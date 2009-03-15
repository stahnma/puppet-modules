# Client portions
# need to distribute /etc/sysconfig/puppet
# needs to ensure puppetd is chkconfiged on
# needs to ensure that puppetd is running
# should check to ensure that puppet is the latest?

# should probably use a template to specify the server???
  file { "/etc/sysconfig/puppet":
       source => "puppet:///puppetclient/puppet" ,
       mode => 444,
       owner => root,
       group => root,
  }

  service { "puppet":
      ensure => true,
      enable => true,
      hasstatus => true,
      hasrestart => true,
  }
