class Node < ActiveRecord::Base
	validates :mac_address, :ip_address, presence: true
	validates :mac_address, uniqueness: true
	belongs_to :device
end
