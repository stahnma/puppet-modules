
class munin::sensor {

    $nm = $operatingsystem ? {
      'CentOS' => 'lm_sensors',
      'Ubuntu' => 'lm-sensors',
      'RedHat' => 'lm_sensors',
      'Debian' => 'lm-sensors',
       default => 'lm_sensors',
      }

    package { $nm:
      ensure => present,
    }

    service { $nm:
      enable => true,
      ensure => running,
      require => Package[$nm],
    }

}
