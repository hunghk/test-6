class Son < Children 
	
	def brothers 
		_b = Son.joins(:families).where(:families => {:parent_id => families.map(&:parent_id)},:gender => 1 ).where.not(:id => id)
		if _b.present?
			_b
		else
			nil
		end
	end
	def default_values
		self.gender ||= 1
	end
end