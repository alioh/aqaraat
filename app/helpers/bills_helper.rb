module BillsHelper
	def all_residents_map
		res_list = []
		residents = current_user.residents
		residents.each { |b| 
			res_list << [b.id, b.name] }
	end

	def all_users_properties
		pro_list = []
		user_id = User.find(current_user)
		properties = current_user.properties
		properties.each { |b| 
			pro_list << [b.id, b.address_one] }
		return pro_list
	end

	def bill_to(a_resident_id)
		resident_name = nil
		residents = Resident.where("id = '?'", a_resident_id)
		residents.each { |b| 
			resident_name = b.name }
		return resident_name
	end

end
