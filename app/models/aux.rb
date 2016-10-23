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
            when "present"
                aux = "has" if THIRD_PSN.include?(options[:pronoun])
            when "past"
                aux = "had"
            end
        end
        aux
    end
end