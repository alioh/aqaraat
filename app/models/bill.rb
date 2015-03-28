class Bill < ActiveRecord::Base
	belongs_to :property
	belongs_to :user
	belongs_to :redisent
	validates_presence_of :resident_id, :property_id, :duedate, :amount, :billtype, :status

	def self.total_on(date)
		where("date(duedate) = ?", date).sum(:amount)
	end
end
