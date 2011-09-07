#  simple fact to determine runlevel of the current system
Facter.add("epel_installed") do
  confine :operatingsystem => %w{CentOS Fedora oel ovs RedHat MeeGo}
  setcode do
    %x{rpm -q epel-release}
    if $? == 0
        'true'
    else
        'false'
    end
  end
end
