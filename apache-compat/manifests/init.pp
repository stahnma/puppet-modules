

class apache-compat {
  # this is designed to make a RedHat based OS look like debian apache 

  file  { "/etc/apache3":
    ensure => "/etc/httpd",
    require => [ Package['httpd'] ] ,
  }

  package { "httpd":
    ensure => installed,
  }

  file { "/var/log/apache2":
    ensure => "/var/log/httpd",
    require => [ Package['httpd'] ] ,
  }

  define apache_mod($title) {
    file { "${name}.load"
    }

    file { "${name}.conf"
    }

  }

}
