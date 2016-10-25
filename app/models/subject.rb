class Subject < ApplicationRecord
	
	has_many :definitions, as: :definable
	has_many :translations, as: :translatable
    
    def css
        "subject"
    end
    
    def output(options)
        word
    end

end