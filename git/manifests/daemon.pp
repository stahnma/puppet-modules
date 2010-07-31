class git::daemon {
    include git
    package{ 'git-daemon':
        ensure => installed,
        require => Package['git'],
    }

    file{ '/etc/xinetd.d/git':
        source =>  "puppet://$server/modules/git/xinetd.d/git",
        require => Package['git-daemon'],
        owner => root, group => 0, mode => 0755,
        notify => Service[xinetd],
    }

    file{ '/etc/sysconfig/git-daemon':
        source => "puppet://$server/modules/git/sysconfig/git-daemon",
        require => Package['git-daemon'],
        owner => root, group => 0, mode => 0644,
    }

     service{ 'xinetd':
        ensure => running,
        enable => true,
        hasstatus => true,
        require => File['/etc/xinetd.d/git'],
     }
}
