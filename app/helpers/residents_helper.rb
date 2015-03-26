module ResidentsHelper

	def all_properties
		user_id = User.find(current_user)
		properties = Property.where("user_id = '?'", current_user)
		list_properties = properties.map { |b| b.id }
	end

	def current_user_id
		user_id = current_user
	end
end
