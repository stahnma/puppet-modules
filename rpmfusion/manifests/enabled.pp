# Enable rpmfusion

class rpmfusion::enabled {
  include rpmfusion::free
  include rpmfusion::nonfree
} 
