class Verb < ApplicationRecord
    
    def get(options)
        
        if options[:tense_modifier] == "simple"
            
            if options[:tense] == "present"
                if options[:structure] == "positive" && Sentence::THIRD_PERSON.include?(options[:pronoun])
                     present_simple
                else
                     word
                end
            elsif options[:tense] == "past"
                if options[:structure] == "positive"
                    past_simple
                else
                    word
                end
            else
                word
            end
        elsif options[:tense_modifier] == "continuous" || options[:tense_modifier] == "perfect-continuous"
            continuous
        elsif options[:tense_modifier] == "perfect"
            past_participle
        end
    
    end
end