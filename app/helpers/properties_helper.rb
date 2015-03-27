module PropertiesHelper
	def us_states
	  [
	    ['Alabama', 'AL'],
	    ['Alaska', 'AK'],
	    ['Arizona', 'AZ'],
	    ['Arkansas', 'AR'],
	    ['California', 'CA'],
	    ['Colorado', 'CO'],
	    ['Connecticut', 'CT'],
	    ['Delaware', 'DE'],
	    ['District of Columbia', 'DC'],
	    ['Florida', 'FL'],
	    ['Georgia', 'GA'],
	    ['Hawaii', 'HI'],
	    ['Idaho', 'ID'],
	    ['Illinois', 'IL'],
	    ['Indiana', 'IN'],
	    ['Iowa', 'IA'],
	    ['Kansas', 'KS'],
	    ['Kentucky', 'KY'],
	    ['Louisiana', 'LA'],
	    ['Maine', 'ME'],
	    ['Maryland', 'MD'],
	    ['Massachusetts', 'MA'],
	    ['Michigan', 'MI'],
	    ['Minnesota', 'MN'],
	    ['Mississippi', 'MS'],
	    ['Missouri', 'MO'],
	    ['Montana', 'MT'],
	    ['Nebraska', 'NE'],
	    ['Nevada', 'NV'],
	    ['New Hampshire', 'NH'],
	    ['New Jersey', 'NJ'],
	    ['New Mexico', 'NM'],
	    ['New York', 'NY'],
	    ['North Carolina', 'NC'],
	    ['North Dakota', 'ND'],
	    ['Ohio', 'OH'],
	    ['Oklahoma', 'OK'],
	    ['Oregon', 'OR'],
	    ['Pennsylvania', 'PA'],
	    ['Puerto Rico', 'PR'],
	    ['Rhode Island', 'RI'],
	    ['South Carolina', 'SC'],
	    ['South Dakota', 'SD'],
	    ['Tennessee', 'TN'],
	    ['Texas', 'TX'],
	    ['Utah', 'UT'],
	    ['Vermont', 'VT'],
	    ['Virginia', 'VA'],
	    ['Washington', 'WA'],
	    ['West Virginia', 'WV'],
	    ['Wisconsin', 'WI'],
	    ['Wyoming', 'WY']
	  ]
	end

	def all_residents_map
		res_list = []
		user_id = User.find(current_user)
		residents = Resident.where("user_id = '?'", current_user)
		residents.each { |b| 
			res_list << [b.id, b.name] }
		#s
	end

	def current_resident_address(resident_id) 
		property_address = nil
		property = Property.where("resident_id = '?'", resident_id)  
		property.each { |b| 
			property_address = b.address_one + ", " + b.address_two }
		return property_address
	end

	def current_resident(a_resident_id)
		resident_name = nil
		residents = Resident.where("id = '?'", a_resident_id)
		residents.each { |b| 
			resident_name = b.name }
		return resident_name
	end

	def property_id_to_address(property_id)
		property_address = nil
		property = Property.where("id= '?'", property_id)  
		property.each { |b| 
			property_address = b.address_one + ", " + b.address_two }
		return property_address
	end
end
