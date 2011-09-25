class statusnet {
  $basepkgs = [ 'php-mysql' , 'php-gd', 'httpd', 'curl',  'php-mbstring', 'memcached', 'php-pecl-memcached', 'php-pecl-mailparse', 'sphinx', 'php-pecl-sphinx', 'php-bcmath', 'php-pecl-apc', 'mysql' , 'mysql-server', 'php-pear-Mail', 'php-pear-DB', 'php-pear-DB-DataObject', 'php-pear-Net-SMTP', 'php-pear-Net-Socket', 'php-pear-Validate', 'php-pear-HTTP-Request2', 'php-pear-Net-URL2' ]

  package { $basepkgs: 
    ensure => installed,
  }

  service { "mysqld":
    ensure => running,
    enable => true,
    require => Package[$basepkgs],
  }

  # until this is packaged, here's how we'll start
  exec { "copy-over":
   unless => "/usr/bin/[ -d '/var/www/statusnet' ]",
   command => "/bin/cp -pr  /home/stahnma/statusnet-1.0.0beta3 /var/www/statusnet",
   creates => "/var/www/statusnet",
  }

  file { "/var/www/statusnet":
     ensure => directory,
     mode => 0775,
     owner => "apache",
     group => "apache",
     require => Exec['copy-over'],
  }

  $subdirs = [ '/var/www/statusnet/avatar', '/var/www/statusnet/background', '/var/www/statusnet/file' ]
  file { $subdirs:
     ensure => directory,
     mode => 0775,
     owner => "apache",
     group => "apache",
  }

  $pass='""'
  $user='root'

  exec { "create_database":
   path => [ '/usr/bin', '/bin', '/usr/sbin', '/sbin' ],
   unless =>  "mysql -u $user -P $pass -NBe \"show databases\" | grep statusnet",
   command => "mysql -u $user -P $pass -NBe \"create database statusnet\"",
   require=> [ Service[mysqld] ],
  }

  file { "/etc/httpd/conf.d/statusnet.conf":
    ensure => present,
    owner => root,
    group => root,
    mode => 644,
    source => "puppet:///modules/statusnet/statusnet.conf",
    notify => Service['httpd']
  }

  service { "httpd":
    ensure => running,
    enable => true,
  }

  exec { "pear-setup":
    path => [ '/usr/bin', '/bin', '/usr/sbin', '/sbin' ],
    command => 'pear install DB_DataObject-1.9.6',
    unless => "pear list | grep \"DB_DataObject    1.9.6\"",
    require => [ File['/var/www/statusnet'] , Package[$basepkgs] ],

  }

}
