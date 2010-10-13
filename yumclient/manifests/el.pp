class yumclient::el  { 
  include 'yumclient::el::epel'
  case $operatingsystem { 
    redhat: { include "yumclient::el::rhn"} 
    centos: { include "yumclient::el::centos"}
  }
}
