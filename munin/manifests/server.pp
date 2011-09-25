

class munin::server {
  $packages  = [ "munin", "perl-Net-CIDR", "perl-Net-CIDR-Lite" ]
  package {  $packages:
    ensure => present,
  }
}
