# Puppet manifest for setting up my mt-daapd server


# Install package
# Edit config in /etc/ with a few variables
# chkconfig service on
# start service


class daap_server {
    package { "mt-daapd":
        ensure => latest
    }
    #file { "/etc/mock":
    #    ensure => directory
    #}
}
