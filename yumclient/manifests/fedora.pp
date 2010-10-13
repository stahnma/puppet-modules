class yumclient::fedora { 
  include 'yumclient::fedora::fedora'
  include 'yumclient::fedora::rpmfusion'
  include 'yumclient::fedora::adobe'
}
