class munin::node::plugins {

    define plugin() {
      file { $name:
        owner => 'root',
        group => 'root',
        mode => '777',
        require => Package['munin-node'],
        path =>  "/etc/munin/plugins/$name",
        ensure => "/usr/share/munin/plugins/$name",
        notify => Service['munin-node'],
     }
  }


  $plugins = [ 'acpi', 'netstat', 'smart_', 'apt'  ]
  plugin { $plugins: }


}
