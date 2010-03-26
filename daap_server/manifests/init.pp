#IPTABLES RULES
#   /sbin/iptables -I INPUT -p tcp --dport 3689 -j ACCEPT
#   /sbin/iptables -I INPUT -p udp --dport 3689 -j ACCEPT 

class daap_server {
  include "daap_server::setup"
}  
