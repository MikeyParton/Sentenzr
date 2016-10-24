module NonModels
	
	def verb_be
		VerbBe
	end

	def will
		Will
	end

	def negation
		Not
	end

	def aux
		Aux
	end
	
	#Not -----------------------------------
	class Not
		def self.css
			"not"
		end

		def self.output(options)
			"not"
		end
	end
	
	#Will -----------------------------------
	class Will
		
		def self.css
			"will"
		end

		def self.output(options)
			"will"
		end
		
	end
	
	#Aux -----------------------------------
	class Aux
    
		def self.css
			"aux"
		end

		def self.output(options)
			if options[:tense_modifier] == "simple"
				if options[:tense] == "present"
					aux = THIRD_PSN.include?(options[:pronoun]) ? "does" : "do"
				elsif options[:tense] == "past"
					aux = "did"
				end
			elsif options[:tense_modifier] == "perfect" || options[:tense_modifier] == "perfect_continuous"
				aux = "have"
				case options[:tense]
				when "present"; aux = "has" if THIRD_PSN.include?(options[:pronoun])
				when "past"; aux = "had"
				end
			end
			aux
		end

	end
	
	#Be -----------------------------------
	class VerbBe  
		
		def self.css
			"be"
		end

		def self.output(options)
			if options[:tense_modifier] == "perfect_continuous"
				word = "been"
			else 
				case options[:tense]
				when "future" 
					word = "be"
				when "past"
					PLURAL.include?(options[:pronoun]) ? "were" : "was"
				when "present"
					case
					when PLURAL.include?(options[:pronoun])
						"are"
					when THIRD_PSN.include?(options[:pronoun])
						"is"
					when options[:pronoun] == "I"
						"am"
					end
				end
			end
		end
		
	end
	
end