# Class yumclient
#
# Purpose:  Setup your yum repositories for you systems
#
# Actions:
#   Based upon your OS type and version, it will configure yum clients
#
# Requires:
#   A Linux client that utilizes yum. (Fedora/Centos/RHEL)
#
# Variables:
#   $proxy : The http proxy your yum repos may require.
#     - Default is set to absent which means fall back to yum.conf.
#     - Can set at top level (yumclient) or in any subclass for specific needs
#
# Sample Usage:
#   include yumclient
#
#
class yumclient {
  # Setting to 'absent' will fall back to the yum.conf
  # Setting proxy here will be the default for all repos.
  #
  #  If you wish to set a proxy for an individual set of repos,
  #   you can declare $proxy in that class, and should scope to
  #   the most specific declaration of proxy.

  $proxy = 'absent'

  case $operatingsystem {
    fedora:  { include 'yumclient::fedora' }
    default: { include 'yumclient::el' } # Assumes default is rhel/centos
  }

  define rpm_gpg_key($path) {
    # Given the path to a key, see if it is imported, if not, import it
    exec {  "import-$name":
      path => "/bin:/usr/bin:/sbin:/usr/sbin",
      command => "rpm --import $path",
      unless => "rpm -q gpg-pubkey-`$(echo $(gpg --throw-keyids < $path) | cut --characters=11-18 | tr [A-Z] [a-z])`",
      require => File[$path],
    }
  }
}
