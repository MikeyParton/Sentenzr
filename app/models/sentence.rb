class Sentence < ApplicationRecord
    belongs_to :verb
    belongs_to :subject
    belongs_to :complement
    
    EDITABLE = ["subject", "verb", "complement"]
    STRUCTURES = ["positive", "negative", "question"]
    TENSES = ["past", "present", "future"]
    TENSE_MODIFIERS = ["simple", "continuous", "perfect", "perfect_continuous"]
    
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
    
    def order        
        case options[:structure]
        when "positive"; order_base = ["subject", "verb", "complement"]
        when "negative"; order_base = ["subject", "aux", "negation", "verb", "complement"]
        when "question"; order_base = ["aux", "subject", "verb", "complement"]
        end
        
        if options[:tense] == "future"
            if target = order_base.index("aux")
                order_base[target] = "will"   
            elsif target = order_base.index("verb")
                order_base.insert(target, "will")
            end
        end
        
        if options[:tense_modifier] == "perfect"
            if !order_base.index("aux")   
                target = order_base.index("verb")
                order_base.insert(target, "aux")
            end   
        end
        
        if options[:tense_modifier] == "continuous"
            if target = order_base.index("aux")   
                order_base[target] = "verb_be"  
            elsif target = order_base.index("verb")
                order_base.insert(target, "verb_be")
            end   
        end
        
        if options[:tense_modifier] == "perfect_continuous"
            if !order_base.index("aux")
                target = order_base.index("verb")
                order_base.insert(target, "aux") 
            end
            if target = order_base.index("verb")
                order_base.insert(target, "verb_be")
            end   
        end
        order_base 
    end
    
    def blocks
        h = order.map do |block|
            element = { words: self.send(block).output(options), class: self.send(block).css }
        end
        h.first[:words].capitalize!
        options[:structure] == "question" ? h << { words: "?"} : h << { words: "."}
        return h
    end
    
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
end