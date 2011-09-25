
class munin::node {

    File {
      ensure => present,
      owner => 'root',
      group => 'munin',
      mode  => 0664,
      notify => Service['munin-node'],
      require => Package['munin-node'],
    }

    package { "munin-node":
      ensure => present,
    }

    service { "munin-node":
      enable => true,
      ensure => running,
      require => Package['munin-node'],
    }

    # Only do this stuff if you have yum
    file  { "/var/lib/munin/plugin-state/yum.state": }

    exec { 'munin_yum':
      command => "munin-run yum",
      path => [ '/bin', '/usr/bin', '/sbin', '/usr/sbin' ] ,
      unless => "test -s /var/lib/munin/plugin-state/yum.state",
      require =>  File['/var/lib/munin/plugin-state/yum.state'],
      notify => Service['munin-node'],
    }


   # IO handle
   file { "/var/lib/munin/plugin-state/iostat-ios.state": }
   file { "/var/lib/munin/plugin-state/diskstats-${ipaddress}": }

    #exec { 'munin_io':
    #  command => "munin-run iostat",
    #  path => [ '/bin', '/usr/bin', '/sbin', '/usr/sbin' ] ,
    #  unless => "test -s /var/lib/munin/plugin-state/iostat-ios.state",
    #  require =>  File['/var/lib/munin/plugin-state/iostat-ios.state'],
    #  notify => Service['munin-node'],
    #}

    file { '/etc/munin/munin-node.conf':
      ensure => present,
      owner => 'root',
      group => 'root',
      mode => 0644,
      content => template('munin/munin-node.conf.erb'),
    }
}

