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

}
