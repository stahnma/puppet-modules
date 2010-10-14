# Class yumclient::fedora
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
#  include yumclient::fedora
#
class yumclient::fedora { 
  include 'yumclient::fedora::fedora'
  include 'yumclient::fedora::rpmfusion'
  include 'yumclient::fedora::adobe'
}
