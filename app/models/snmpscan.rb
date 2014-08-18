def snmpscan
	for router in @routers
		SNMP::Manager.open(:host => router.ip_address, :community => router.community) do |manager|
			response = manager.get_bulk(0,999, "ipNetToMediaPhysAddress")
			response.each_varbind do |vb|
				rawMacAddr = "#{vb.value}"
				rawIpAddr = "#{vb.name}".to_s
				ipaddr = rawIpAddr.slice(34..50)
				macaddr = rawMacAddr.unpack('H*').to_s.tr('"||[||]','')
				#puts "#{macaddr} - #{ipaddr}"
				Node.create(:mac_address => macaddr, :ip_address => ipaddr) unless Node.where(:mac_address => macaddr)
			end
		end
	end
end