class Property < ActiveRecord::Base
	attr :full_address, :latitude, :longitude
	belongs_to :user
	has_many :bills
	geocoded_by :address_one
	after_validation :geocode

end