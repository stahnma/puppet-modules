# Class yumclient::el
#
# Parameters:
#   None
#
# Actions:
#   Include the correct subclasses based on OS
#
# Reqiures:
#   None
#
# Sample Usage:
#  include yumclient::el
#
class yumclient::el  {
  include 'yumclient::el::epel'
  case $operatingsystem {
    redhat: { include "yumclient::el::rhel"}
    centos: { include "yumclient::el::centos"}
  }
}
