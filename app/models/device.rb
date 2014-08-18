class Device < ActiveRecord::Base
	validates :name, :ip_address, :device_type, :community, presence: true
	validates :name, :ip_address, uniqueness: true 
	belongs_to :location
	belongs_to :pages
	has_many :nodes
end
