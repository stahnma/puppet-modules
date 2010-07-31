
# Require mock module 
class rpmdev { 
  # Fedora RPM Devel Packages
  $fpkgs = [ "rpmdevtools", "fedora-packager", "git", "subversion" ] 

  package { $fpkgs: 
    ensure => installed,
#    require => [ Class['mock'] ] 
  }
}

# Populate the $HOME CVS Stuff
