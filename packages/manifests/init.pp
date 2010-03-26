class packages {
  $family = $operatingsystem? {
      debian => "debian",
      fedora => "fedora",
      default => "rhel",
    }
   include "packages::$family"
}
