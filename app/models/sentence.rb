class Sentence < ApplicationRecord
    belongs_to :verb
    belongs_to :subject
    belongs_to :complement
    
    EDITABLE = ["subject", "verb", "complement"]
    STRUCTURES = ["positive", "negative", "question"]
    FIRST_PERSON = ["I"]
    PLURAL = ["we", "they", "you"]
    THIRD_PERSON = ["he", "she", "it"]
    TENSES = ["past", "present", "future"]
    TENSE_MODIFIERS = ["simple", "continuous", "perfect", "perfect-continuous"]
    
    def self.setup
        self.create!(
            subject_id: 1,
            verb_id: 3,        
            complement_id:1,    
            tense: "present",
            tense_modifier: "simple",
            structure: "positive"
        )
    end
    
    def options
        { 
            pronoun: subject.pronoun,
            structure: structure,
            tense: tense,
            tense_modifier: tense_modifier
            }
    end
    
    def pronoun_is(pronoun_query)
        pronoun_query.include?(options[:pronoun])
    end
    
    def tense_is(tense_query)
        options[:tense] == tense_query
    end
    
    def modifier_is(modifier_query)
        options[:tense_modifier] == modifier_query
    end

    def order
        case options[:structure]
        when "positive"
            case
            ###Simple##########################################   
            when modifier_is("simple") 
                if tense_is("future")
                    #[we, will, eat, pizza]
                    ["subject", "will", "verb", "complement"]
                else
                    #[we, eat, pizza]
                    ["subject", "verb", "complement"]
                end
            ###Continuous#######################################    
            when modifier_is("continuous") && tense_is("future")
                #[we, will, be, eating, pizza]
                ["subject", "will", "verb_be", "verb", "complement"]
            when modifier_is("continuous") && tense_is("present")
                #[we, are, eating, pizza]
                ["subject", "verb_be", "verb", "complement"]
                #[we, were, eating, pizza]
            when modifier_is("continuous") && tense_is("past")
                ["subject", "verb_be", "verb", "complement"]        
            ###Perfect##########################################      
            when modifier_is("perfect")
                if tense_is("future")
                    #[we, will, have, eaten, pizza]
                    ["subject", "will", "have", "verb", "complement"]
                else
                    #[we, have/had, eaten, pizza]
                    ["subject", "have", "verb", "complement"]
                end
            when modifier_is("perfect-continuous")
                if tense_is("future")
                    #[we, will, have, been, eating, pizza]
                    ["subject", "will", "have", "verb_be", "verb", "complement"]
                else
                    #[we, have/had, been, eating, pizza]
                    ["subject", "have", "verb_be", "verb", "complement"]
                end    
            end
        when "negative"
            case
            when modifier_is("simple")
                if tense_is("future")
                    ["subject", "will", "negation", "verb", "complement"]
                else
                ["subject", "aux_do", "negation", "verb", "complement"]   
                end
            when modifier_is("continuous")
                if tense_is("future")
                    ["subject", "will", "negation", "verb_be", "verb", "complement"]
                else
                    ["subject", "verb_be", "negation", "verb", "complement"]
                end
            when modifier_is("perfect")
                if tense_is("future")
                    #[we, will, not, have, eaten, pizza]
                    ["subject", "will", "negation", "have", "verb", "complement"]    
                else
                    ["subject", "have", "negation", "verb", "complement"]
                end
            when modifier_is("perfect-continuous")
                if tense_is("future")
                    #[we, will, not, have, been, eating, pizza]
                    ["subject", "will", "negation", "have", "verb_be","verb", "complement"]    
                else
                    ["subject", "have", "negation", "verb_be" ,"verb", "complement"]
                end    
            end
        when "question"
            case
            when modifier_is("simple")
                if tense_is("future")
                    ["will", "subject", "aux_do", "verb", "complement"] 
                else
                    ["aux_do", "subject", "verb", "complement"]
                end
            when modifier_is("perfect") 
                if tense_is("future")
                    ["will", "subject", "have", "verb", "complement"]
                else 
                    ["have", "subject", "verb", "complement"]
                end
            when modifier_is("continuous")
                if tense_is("future")
                    ["will", "subject", "verb_be", "verb", "complement"]
                else    
                    ["verb_be", "subject", "verb", "complement"]
                end
            when modifier_is("perfect-continuous") 
                if tense_is("future")
                    #[will, we, have, been, eating, pizza]
                    ["will", "subject", "have", "verb_be", "verb", "complement"]
                else 
                    #[have, we, been, eating, pizza]
                    ["have", "subject", "verb_be", "verb", "complement"]
                end
            end
        end 
    end
    
    def blocks
        h = order.map do |e|
            if e == "verb_be" || e == "will" || e =="negation" || e == "have" || e == "aux_do"
                element = { words: eval("#{e}"), class: e }
            else
                element = { words: eval("#{e}.get(options)"), class: e }
            end    
        end
        puts h
        h.first[:words].capitalize!
        if options[:structure] == "question"
            h << { words: "?", class: "punctuation"}
        else
            h << { words: ".", class: "punctuation"}
        end
        return h
    end
    
    def will
        "will"
    end
    
    def verb_be
        if modifier_is("perfect-continuous")
            "been"
        else 
            case options[:tense]
            when "future" 
                "be"
            when "past"
                pronoun_is(PLURAL) ? "were" : "was"
            when "present"
                case
                when pronoun_is(PLURAL)
                    "are"
                when pronoun_is(THIRD_PERSON)
                    "is"
                when pronoun_is(FIRST_PERSON)
                    "am"
                end
            end
        end
    end
    
    def aux_do
        case options[:tense]
        when "present"
            pronoun_is(THIRD_PERSON) ? "does" : "do"
        when "past"
            "did"
        end 
    end
    
    def have
        case options[:tense]
        when "present"
            pronoun_is(THIRD_PERSON) ? "has" : "have"
        when "past"
            "had"
        when "future"
            "have"
        end
    end
    
    def negation
        "not"
    end
end