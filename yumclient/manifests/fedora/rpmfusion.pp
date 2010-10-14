# Class yumclient::fedora::rpmfusion
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
#  include yumclient::fedora::rpmfusion
#
class yumclient::fedora::rpmfusion { 
  include 'yumclient::fedora::rpmfusion::free'
  include 'yumclient::fedora::rpmfusion::nonfree'
}
