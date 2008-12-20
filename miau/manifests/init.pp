# Puppet manifest for setting up my mt-daapd server


# Install package
# Edit config in /home/stahnma with a few variables
# start service


class miau {
    package { "miau":
        ensure => latest
    }

#    file { "miaurc:
#        path => $miaurc_path,
#        ensure => present,
#        content => template('miau/miaurc.erb'),
#        owner => $miau_user,
#        mode => '640',
#        require => Package['miau'],
#    }
#    service { "mt-daapd":
#        ensure => running,
#        enable => true,
#        hasrestart => true,
#        require => [ 
#             File["/etc/mt-daapd.conf"],
#             Package["mt-daapd"],
#        ]
#   }
}
