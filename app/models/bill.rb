class Bill < ActiveRecord::Base
	belongs_to :property
	belongs_to :user
	belongs_to :redisent

	def self.total_on(date)
		where("date(duedate) = ?", date).sum(:amount)
	end
end
