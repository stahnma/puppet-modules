# using http://www.shakthimaan.com/installs/gitosis.html as guide
class gitosis {
  include ::git

  package { 'gitosis':
      ensure => 'installed',
  } 

  user { 'gitosis':
      ensure => present,
      home => "/srv/gitosis",
      require => Package['gitosis'],
  }  

  file { '/srv/gitosis': 
      ensure => directory,
      owner => 'gitosis',
      group => 'gitosis',
      mode => 0755,
      require => User['gitosis'],
  }
   

  file { 'gitosis-seed':
    path => '/tmp/id_dsa.pub',
    ensure => present,
    source => 'puppet:///modules/gitosis/stahnma/id_dsa.pub',
  }

  exec { 'gitosis-init':
    cwd =>  "/srv",
    path =>  "/bin:/usr/bin:/sbin:/usr/sbin",
    command => "env -i gitosis-init < /tmp/id_dsa.pub",
    require => [ File['gitosis-seed'], File['/srv/gitosis'] ] ,
    unless => " test -f /srv/gitosis/repositories",
    logoutput => "on_failure",
    user => 'gitosis',
  } 
}
