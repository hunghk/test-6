class Person < ActiveRecord::Base 
	has_many :families 
	after_initialize :default_values

	# Define first name for Person
	# @Return string
	def first_name 
		if name.present?
			arrName = name.split(' ')
			if arrName.count > 0
				arrName.first
			else
				nil
			end
		else
			nil
		end 
	end 

	# Define say_something for Person
	# @Return string
	def say_something
		'Hello, my name is '<< name << '.'
	end

	def default_values
		self.gender ||= 0
	end
	
	# Define older_than for Person
	# @Return number
	def older_than ps
		if ps.nil?
			0
		end
		age - ps.age
	end
end
