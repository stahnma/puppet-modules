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

# May want to require rpmfusion stuff so I can has mp3s

class desktop
{ 
  $pkg = [ 'rdesktop', 'firefox', 'konversation', 'pidgin', 'amarok', 'gimp', 'control-center-extra', 'liberation-mono-fonts', 'gedit', 'pidgin-otr', 'gnu-free-mono-fonts', 'xine-lib-extras-freeworld', 'fortune-firefly', 'cups' , 'printer-filters' ] 
  package { $pkg: 
    ensure => installed,
  }
}
