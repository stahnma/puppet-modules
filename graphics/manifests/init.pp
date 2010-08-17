# Ideas 
#  rdesktop
#  firefox
#  GNOME Desktop Environment
#  X Windows Enviornment
# konversation
# openoffice
# pidgin
# pidgin-otr
# kdebase
# amarok
# rdesktop  

class graphics
{ 
  $pkg = [ 'rdesktop', 'firefox', 'konversation', 'pidgin', 'amarok', 'gimp' ] 
  package { $pkg: 
    ensure => installed,
  }
}
