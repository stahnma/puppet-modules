# Puppet manifest for setting up my mt-daapd server
class daap_server::setup {
    package { "mt-daapd":
        ensure => latest
    }
    file { "/etc/mt-daapd.conf":
        ensure => present,
        content => template('daap_server/mt-daapd.conf.erb'),
        owner => 'root',
        mode => '640',
        require => Package['mt-daapd'],
        notify => Service["mt-daapd"]
    }
    service { "mt-daapd":
        ensure => running,
        enable => true,
        hasrestart => true,
        require => [ 
             File["/etc/mt-daapd.conf"],
             Package["mt-daapd"],
        ]
   }
}
