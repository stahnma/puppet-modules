# Package installation and control

# What goes everywhere?
  $everyWherePkgs = [ 'vim-enhanced', 'yum-utils', 'git' , 'strace' , 'nmap', 'wget', 'bind-utils', 'bash-completion' , 'ruby-ldap' ]
  package { $everyWherePkgs: ensure => installed }

# EL 5
 # need to manage this manually -- don't feel like it right now
  $el5Pkgs = [ 'epel-release' ]

# F9

# F10

# F11

# Desktop
  $desktopPkgs = [ 'pidgin', 'amarok' , 'ktorrent'  , 'amarok-extras-freeworld', 'ffmpeg', 'ffmpeg2theora', 'gmplayer', 'firefox', 'konversation', 'gimp', 'gwibber', 'k3b-extras-freeworld', 'openoffice.org-writer', 'openoffice.org-calc', 'openoffice.org-impress', 's3cmd', 'synergy', 'virt-manager', 'vlc',     ]

# Server
  $serverPkgs = [ 'curl', 'httpd', 'irssi',  'logrotate', 'net-snmp-utils', 'python-ldap'  ]

# Lamp
  $lampPkgs = [ 'php-cli', 'php-common', 'php-Smarty', 'php-pear', 'mysql-server', 'mysql'  ]

# Devel
  $normalDevel = [ 'rubygem-rake', 'rubygem-rails', 'php-common', 'PyYAML', 'rpmbuild', 'rpmdevtools', 'cvs', 'subversion', 'python-cheetah', 'ruby-irb', 'ruby-rdoc' ]

# Fedora Developer
  $fedoraDeveloperPkgs = [ 'fedora-packager' , 'createrepo', 'rubygem-gem2rpm', 'yum-arch' ]

# Ripping
 $rippingPkgs = [ 'abcde' ]

# Media Production
 $mediaPkgs = [ 'audacity-freeworld' , 'jack-audio-connection-kit', 'jack-rack', 'rosegarden4'  ]

# SSO Development
 $ssoDevPkgs = [ 'apr-devel', 'httpd-devel', 'openssl-devel' ]

# X10
 $x10Pkgs = [ 'bottlerocket' ]

# Expiremental
 $expPkgs = [ 'notification-daemon' ,  ]

# also manaul
#rpmfusion-free-release
#rpmfusion-nonfree-release
