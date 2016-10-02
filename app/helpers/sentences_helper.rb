module SentencesHelper
    def option_active?(field, value)
        "active" if eval("@sentence.#{field}") == value
    end
    
    def is_editing?(block)
        "active" if session[:editing] == "#{block}_options"
    end
end
