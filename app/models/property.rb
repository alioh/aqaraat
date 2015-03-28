class Property < ActiveRecord::Base
	#attr_accessor :full_address, :latitude, :longitude
	belongs_to :user
	has_one :resident
	has_many :bills
	geocoded_by :address_one
	after_validation :geocode
	validates_presence_of :address_one, :addresstype, :city, :state

end