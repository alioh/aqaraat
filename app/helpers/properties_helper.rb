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

	def all_resedints_map
		res_list = []
		user_id = User.find(current_user)
		resedints = Resident.where("user_id = '?'", current_user)
		resedints.each { |b| 
			res_list << [b.id, b.name] }

	end

end
