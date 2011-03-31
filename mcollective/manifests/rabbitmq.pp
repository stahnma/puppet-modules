# Simple class to setup mcollective on Fedora using rabbitmq

class mcollective::rabbitmq {

  $mqpkgs = [ 'tk', 'unixODBC', 'rabbitmq-server' ] 

  package { $mqpkgs:
     ensure => installed,
  }

  file { "/usr/lib/rabbitmq/lib/rabbitmq_server-2.2.0/plugins":
     ensure => directory,
     require => [ Package[$mqpkgs] ], 
  }

  file { "amqp_client":
     ensure => present,
     path => "/usr/lib/rabbitmq/lib/rabbitmq_server-2.2.0/plugins/amqp_client_2.2.0.ez",
     source => "puppet:///modules/mcollective/rabbitmq/amqp_client-2.2.0.ez",
     owner => 'root',
     group => 'root',

     require => [ Package[$mqpkgs], File['/usr/lib/rabbitmq/lib/rabbitmq_server-2.2.0/plugins'] ] ,  
  }

  file { "stomp_client":
     ensure => present,
     path => "/usr/lib/rabbitmq/lib/rabbitmq_server-2.2.0/plugins/rabbitmq_server_2.2.0.ez",
     source => "puppet:///modules/mcollective/rabbitmq/rabbit_stomp-2.2.0.ez",
     owner => 'root',
     group => 'root',
     require => [ Package[$mqpkgs], File['/usr/lib/rabbitmq/lib/rabbitmq_server-2.2.0/plugins'] ] ,  
  }

  service { "rabbitmq-server":
     ensure => running, 
     enable => true,
     hasrestart => true,
     hasstatus => true,
     require => [ Package[$mqpkgs], File['amqp_client'], File['stomp_client'], File['rabbit-config' ] ]  ,  
  }

  file { "rabbit-config":
    ensure => present, 
    path => "/etc/rabbitmq/rabbitmq.conf",
    source => "puppet:///modules/mcollective/rabbitmq/rabbitmq.conf", 
    owner => 'root',
    group => 'root',
    require => [ Package[$mqpkgs], File['amqp_client'], File['stomp_client']  ] ,  
    notify =>  [ Service['rabbitmq-server'] ] ,
  }
    
     


}
