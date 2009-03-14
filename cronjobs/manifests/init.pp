# Install cronjobs

file { "/etc/cron.daily/00yum":
    owner => root, 
    group => root, 
    mode => 755,
    source => "puppet:///cron/00yum"
}
