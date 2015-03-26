module ApplicationHelper

	def username
		n = User.find(current_user)
		n.name
	end

	def current_resident_address(property_id) 
		property = Property.find(property_id)  rescue nil
		return property.address_one + ", " + property.address_two
	end

end
