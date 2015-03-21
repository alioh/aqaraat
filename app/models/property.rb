class Property < ActiveRecord::Base
	attr :full_address, :latitude, :longitude
	belongs_to :user
	has_many :bills
	geocoded_by :full_address
	after_validation :geocode
end