class Children < Person 

	# Define addParent for Children
	# @Return boolean
	def addParent(pr)
		fm = Family.new
		fm.person_id = id
		fm.parent_id = pr.id
		if fm.save
			puts 'Parent was added successfully!'
			true
		else 
			puts 'Parent was added unsuccessfully!'
			false
		end
	end 

	# Define father for Children
	# @Return object
	def father
		father = Father.where(:id =>families.map(&:parent_id).uniq,:gender => 1 )
		if father.present?
			father
		else
			nil
		end
	end 

	# Define mother for Children
	# @Return object
	def mother
		mother = Mother.where(:id =>families.map(&:parent_id).uniq,:gender => 0 )
		if mother.present?
			mother
		else
			nil
		end
	end
	

	# Define parent for Children
	# @Return object
	def parents
		father = Parent.where(:id =>families.map(&:parent_id)  )
		if father.present?
			father
		else
			nil
		end
	end 
	
	def default_values
		self.gender ||= 0
	end
end