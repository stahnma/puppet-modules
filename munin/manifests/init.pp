
class munin {
  if $network_master == "true" {
    notice "Setting up munin server"
    include munin::server
  }
  include munin::node
  include munin::node::plugins
  include munin::sensor
}
