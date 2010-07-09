class basic::yum-plugins{
  $inst = $operatingsystem? {
    fedora => "installed",
    default => "absent",
  }
  package { "yum-presto":
    ensure => $inst,
  }
}
