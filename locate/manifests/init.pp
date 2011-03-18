# Class: locate
#
# Class ensures and configures the locate/updatedb setup
# 
# Parameters:
#   None
#
# Actions:
#   Installs package, puts files in /etc/cron.daily and /etc/updatedb.conf
#
# Requires:
#   Requires a working cron setup with /etc/cron.daily, but the package manager 
#     should handle that
#
# Sample Usage:
#   include 'locate'
#
class locate { 
  case $operatingsystem {
    centos: { include locate::centos }
    fedora: { include locate::centos }
    redhat: { include locate::centos }
    default: { include locate::debian }
  }
}
