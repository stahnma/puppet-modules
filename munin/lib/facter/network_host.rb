

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
