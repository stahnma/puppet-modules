# Install package
# configure backups
# setup root user password  
# install client libs
# have a replication add-on module

class mysql{ 
  $family = $operatingsystem? {
      debian => "debian",
      fedora => "fedora",
      default => "rhel",
    }
   include "mysql::$family"
}
