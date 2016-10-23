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