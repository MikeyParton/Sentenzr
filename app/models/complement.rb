class Complement < ApplicationRecord
  
	has_many :definitions, as: :definable
	has_many :translations, as: :translatable
	
	def css
		"complement"
	end

	def output(options)
		word
	end
	
end
