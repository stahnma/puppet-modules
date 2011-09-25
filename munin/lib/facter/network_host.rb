
# These facts are horrible and will be replaced with a Puppet Lookup function eventually

Facter.add(:network_master) do
  fqdn = Facter.value(:fqdn)
  setcode do
    if fqdn == 'duo.stahnkage.com'
       "true"
    else
       "false"
    end
  end
end


Facter.add(:network_master_ip) do 
  setcode { '192.168.1.102' }
end
