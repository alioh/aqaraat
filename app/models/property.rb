class Property < ActiveRecord::Base
	belongs_to :user
	has_one :resident
	has_many :bills
	geocoded_by :address_one
	after_validation :geocode
	validates_presence_of :address_one, :addresstype, :city, :state
end