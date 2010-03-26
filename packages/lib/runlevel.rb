#  simple fact to determine runlevel of the current system
Facter.add("runlevel") do
  confine :kernel => :linux
  setcode do
    %x{who -r}.split[1].chomp.to_i
  end
end
