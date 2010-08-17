# Setup
# apache setup
# createrepo
# repoview


class yumserver { 
  # Place holder to install apache until I write/find a decent apache module
  package { "apache": 
    ensure => 'installed',
  }
 
  include 'yumserver::createrepo'

  
}
