class Parent < Person
	before_save :check_age 

	# Define addChildren for Parent
	# @Return boolean
	def addChildren(child)
		fm = Family.new
		fm.person_id = child.id
		fm.parent_id = id
		if fm.save
			puts 'children was added successfully!'
		else 
			puts 'children was added unsuccessfully!'
		end
	end 


	# Define sons for Parent
	# @Return object
	def sons 
		_s = Son.joins(:families).where(:families => {:parent_id => id},:gender => 1 )
		if _s.present?
			_s
		else
			nil
		end
	end

	# Define daughters for Parent
	# @Return object
	def daughters 
		_d = Daughter.joins(:families).where(:families => {:parent_id => id},:gender => 0 )
		if _d.present?
			_d
		else
			nil
		end
	end

	# Define children for Parent
	# @Return object
	def children 
		_c = Children.joins(:families).where(:families => {:parent_id => id} )
		if _c.present?
			_c
		else
			nil
		end
	end


	def default_values
		self.gender ||= 0
  end
	protected
		def check_age
			if age.blank?
				raise 'Error.! Age is not empty' 
			end 

			if gender.blank?
				gender = 0
			end

			if age < 20 && gender == 1
				raise 'Error.! Father must over 20'
			elsif age < 18 && gender == 0
				raise 'Error.! Mother must over 18' 
			end
		end
end