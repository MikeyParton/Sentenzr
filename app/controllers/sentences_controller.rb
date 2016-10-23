class SentencesController < ApplicationController
    def show
        if session[:sentence].nil?
            @sentence = Sentence.setup
            session[:sentence] = @sentence.id
            session[:editing] = "subject_options"
        else
            @sentence = Sentence.find(session[:sentence])
        end
        @subjects = Subject.all
        @verbs = Verb.all
        @complements = Complement.all
    end
    
    def update
        @sentence = Sentence.find(session[:sentence])
        @subjects = Subject.all
        @verbs = Verb.all
        @complements = Complement.all
        @sentence.update_attributes(sentence_params)
        respond_to do |format|
            format.js
        end
    end
    
    def structure_options
        @sentence = Sentence.find(session[:sentence])
        session[:editing] = "structure_options"
        respond_to do |format|
            format.js
        end
    end
    
    def subject_options
        @sentence = Sentence.find(session[:sentence])
        @subjects = Subject.all
        session[:editing] = "subject_options"
        respond_to do |format|
            format.js
        end
	end
    
    def verb_options
        @sentence = Sentence.find(session[:sentence])
        @verbs = Verb.all
        session[:editing] = "verb_options"
        respond_to do |format|
            format.js
        end
	end
    
    def complement_options
        @sentence = Sentence.find(session[:sentence])
        @complements = Complement.all
        session[:editing] = "complement_options"
        respond_to do |format|
            format.js
        end
	end
    
    private
        def sentence_params
            params.require('sentence').permit(:subject_id, :verb_id, :complement_id, :structure, :tense, :tense_modifier)
        end
    
end
