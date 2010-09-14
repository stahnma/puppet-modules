# Class: oracle_instant_client::ruby
#
# Class sets up ruby bindings for Oracle 
#
# Parameters:
#   None
#
# Actions:
#   Ensures rubygem-oci8-doc is installed (which pulls in rubygem-oci8)
#   
# Requires: 
#   Class['oracle_instant_client']
#
# Sample usage:
#   include 'oracle_instant_client::ruby'
#


class oracle_instant_client::ruby { 
  include ::oracle_instant_client
  package { "rubygem-oci8-doc": 
   ensure => installed,
   require => Class['oracle_instant_client'],
  } 
}
