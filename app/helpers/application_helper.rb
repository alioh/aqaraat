module ApplicationHelper

	def username
		n = User.find(current_user)
		n.name
	end

end
