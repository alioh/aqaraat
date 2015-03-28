class Resident < ActiveRecord::Base
	has_many :bills
	has_one :property
	belongs_to :user
	validates_presence_of :resident_id, :addresstype, :city, :state
end
