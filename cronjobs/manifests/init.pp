# Install cronjobs

# Should probably ensure this is a redhat/fedora/centos based system

  file { "cron-yum":
    path => '/etc/cron.daily/00yum', 
    owner => root, 
    group => root, 
    mode => 755,
    require => Package['crontabs'], 
    source => "puppet:///cronjobs/00yum"
  }
