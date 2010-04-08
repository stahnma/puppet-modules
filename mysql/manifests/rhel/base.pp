class mysql::rhel::base { 
  $mysql_package = [ "mysql-server", "mysql" ]  
  package { $mysql_package: ensure => installed, }
}
