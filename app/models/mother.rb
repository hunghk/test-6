class Mother < Parent

	# Define say_something for Father
	# @Return object
	def self.say_something
		'Hello, I am your mother.'
	end

	def say_something
		'Hello, I am your mother.'
	end
 
	def default_values
		self.gender ||= 0
	end
	protected
		def check_age
			if age.blank?
				raise 'Error.! Age is not empty' 
			end 
			gender = 0

			if age < 18 
				raise 'Error.! Mother must over 18'  
			end
		end 
end