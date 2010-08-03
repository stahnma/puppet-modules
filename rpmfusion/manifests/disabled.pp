# Disable rpmfusion

class rpmfusion::disabled {
  $fusions = [ 'rpmfusion-free-release', 'rpmfusion-nonfree-release' ] 
  package { $fusions: 
    ensure => absent,
  }
} 
