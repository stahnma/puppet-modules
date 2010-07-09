# Install cronjobs
class cronjobs
{
# Should probably ensure this is a redhat/fedora/centos based system

  file { "cron-yum":
    path => '/etc/cron.daily/00yum', 
    owner => root, 
    group => root, 
    mode => 755,
    source => "puppet:///modules/cronjobs/00yum"
  }

  
}
