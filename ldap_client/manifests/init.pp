# Deploy /etc/openldap/ldap.conf for client searching
class ldap_client {
    package { "openldap":
        ensure => latest
    }
    file { "/etc/openldap/ldap.conf":
        ensure => present,
        content => template('ldap_client/ldap.conf.erb'),
        owner => 'root',
        mode => '644',
        require => Package['openldap'],
    }
}

