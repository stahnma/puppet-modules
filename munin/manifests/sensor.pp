
class munin::sensor {
    package { "lm-sensors":
      ensure => present,
    }

    service { "lm-sensors":
      enable => true,
      ensure => running,
      require => Package['lm-sensors'],
    }
}
