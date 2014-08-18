require 'snmp'
require '/Users/eric/rails/ninjadetector/config/environment.rb'

include SNMP

@routers = Device.where(:device_type => 'Router')

for router in @routers 
	SNMP::Manager.open(:host => router.ip_address, :community => router.community) do |manager|
		begin
			response = manager.get_bulk(0,999, "ipNetToMediaPhysAddress")
			response.each_varbind do |vb|
				rawMacAddr = "#{vb.value}"
				rawIpAddr = "#{vb.name}".to_s
				ipaddr = rawIpAddr.slice(34..50)
				macaddr = rawMacAddr.unpack('H*').to_s.tr('"||[||]','')
				if Node.exists?(:mac_address => macaddr)

				else
					SNMP::Manager.open(:host => ipaddr, :community => router.community, :timeout => 1) do |mgr|
						begin
							puts ipaddr
							auth = mgr.get("sysName.0")
							authorization = 'SNMP'
						rescue Errno::EHOSTUNREACH
							authorization = 'Rogue'
						rescue SNMP::RequestTimeout
							authorization = 'Rogue'
						end
								
						puts "#{ipaddr} - #{authorization}"

						Node.create(	:mac_address => macaddr, 
										:ip_address => ipaddr, 
										:name => router.name, 
										:authorization => authorization
									)
					end
				end
			end
		rescue SNMP::RequestTimeout
			#Do nothing
		end
	end
end

#@unknownNodes = Node.where(:authorization => '0')
#
#for unknownNode in @unknownNodes
#
#	SNMP::Manager.open(:host => unknownNode.ip_address, :community => router.community, :timeout => 2) do |mgr| 
#		begin
#			auth = mgr.get("sysName.0")
#			authorization = 'SNMP'
#		rescue SNMP::RequestTimeout
#			authorization = 'Rogue'
#		end
#		puts "#{unknownNode.ip_address} is #{authorization}"
#		
#	end
#end
#

