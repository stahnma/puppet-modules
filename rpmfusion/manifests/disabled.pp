# Disable rpmfusion

class rpmfusion::disabled {
  $fusions = [ 'rpm-fusion-free', 'rpm-fusion-nonfree' ] 
  package { $fusions: 
    ensure => absent,
  }
} 
