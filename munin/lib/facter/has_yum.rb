

Facter.add(:has_yum) do
   setcode do 
     if   File.exists?("/usr/bin/yum")
       "true"
     else
       "false"
     end
   end
end
