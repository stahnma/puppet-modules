class basic::selinux-permissive {
  exec { "selinux-permissive":  
    path => "/bin:/usr/bin:/sbin:/usr/sbin",
    command => "setenforce 0",
    onlyif => "selinuxenabled",
  }  
}
