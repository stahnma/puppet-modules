
class mock { 
  package { "mock": 
    ensure => present,
  }

  @file { "/home/stahnma":
    owner => 'stahnma',
    group => 'stahnma',
    mode => 755,
    ensure => directory,
    require => [ Group['stahnma'], User['stahnma'] ],
    
  }

  @user { "stahnma": 
    ensure => present,
    home => '/home/stahnma',
    comment => "Michael Stahnke",
    uid => 13802,
    shell => "/bin/bash",
    gid => "13802",
    groups =>  [ "stahnma", "mock", "wheel" ],
    #require => File['/home/stahnma'],
  }

  @group { "mock": 
    ensure => present
  }

  @group { "stahnma":
    ensure => present, 
    gid => 13802,
  }
  realize(Group[stahnma])  
  realize(User[stahnma])
  realize(Group[mock], File['/home/stahnma'])
}
