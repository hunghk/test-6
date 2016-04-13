class Father < Parent


	# Define say_something for Father
	# @Return object
	def self.say_something
		'Hello, I am your father.'
	end	

	def say_something
		'Hello, I am your father.'
	end

	def default_values
		self.gender ||= 1
	end

	# Define check father of children
	# @Return boolean
	def father_of?(child)
		_c = Children.joins(:families).where(:families => {:parent_id => id, :person_id => child.id} )
		if _c.present?
			true
		else
			false
		end
	end 

	protected
		def check_age
			if age.blank?
				raise 'Error.! Age is not empty' 
			end 
			gender = 1

			if age < 20
				raise 'Error.! Father must over 20'  
			end
		end 
end