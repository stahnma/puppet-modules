# Install cronjobs


# Should probably ensure this is a redhat/fedora/centos based system
file { "/etc/cron.daily/00yum":
    owner => root, 
    group => root, 
    mode => 755,
    source => "puppet:///cronjobs/00yum"
}
