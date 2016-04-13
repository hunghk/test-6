class Daughter < Children

	def default_values
		self.gender ||= 0
	end
	
	# Define say_something for Daughter
	# @Return object
	def self.say_something
		'Hello, I am your Daughter.'
	end	

	def say_something
		'Hello, I am your Daughter.'
	end

end