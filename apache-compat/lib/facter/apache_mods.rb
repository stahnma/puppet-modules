
Facter.add(:apache_mods) do
  setcode { 
    Dir['/etc/httpd/modules/**'].join(',')
  }
end
