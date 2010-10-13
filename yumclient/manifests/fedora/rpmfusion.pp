class yumclient::fedora::rpmfusion { 
  include 'yumclient::fedora::rpmfusion::free'
  include 'yumclient::fedora::rpmfusion::nonfree'

}
