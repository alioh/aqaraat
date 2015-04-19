class Resident < ActiveRecord::Base
	has_many :bills
	has_one :property
	belongs_to :user
	validates_presence_of :name
end
