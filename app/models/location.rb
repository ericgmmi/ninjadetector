class Location < ActiveRecord::Base
	validates :city, presence: true
	validates :state, presence: true
	has_many :devices
end
