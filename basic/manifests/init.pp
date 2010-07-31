class basic {
  # Install yum presto
  # Disable selinux
  # Disable IPtables
  # Ensure rake, vim, bind-utils are installed
  include "basic::yum-plugins"
  include "basic::selinux-permissive"
  include "basic::packages"
  include "basic::ssh"
}
