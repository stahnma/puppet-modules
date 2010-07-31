
class mock { 
  package { "mock": 
    ensure => present,
  }

  @user { "stahnma": 
    ensure => present,
    comment => "Michael Stahnke",
    uid => 13802,
    shell => "/bin/bash",
    gid => "13802",
    groups =>  [ "stahnma", "mock", "wheel" ],
  }

  @group { "mock": 
    ensure => present
  }

  @group { "stahnma":
    ensure => present, 
    gid => 13802,
  }
  
  realize(User[stahnma], Group[mock], Group[stahnma])
}
