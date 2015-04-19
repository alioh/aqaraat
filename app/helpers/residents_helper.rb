module ResidentsHelper

	def all_properties
		user_id = User.find(current_user)
		properties = Property.where("user_id = '?'", current_user)
		list_properties = properties.map { |b| b.id }
	end

	def current_user_id
		user_id = current_user
	end

	def this_user_property(resident_id)
		property_address = nil
		property = Property.where("resident_id = '?'", resident_id)
		property.each { |b| 
			property_address = b.address_one + ", " + b.address_two }
		return property_address
	end
end
