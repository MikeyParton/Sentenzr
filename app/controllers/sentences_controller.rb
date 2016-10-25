class SentencesController < ApplicationController
    def show
        if session[:sentence].nil?
					@sentence = Sentence.setup
					session[:sentence] = @sentence.id
					session[:editing] = "subject"
        else
					@sentence = Sentence.find(session[:sentence])
        end
        unless session[:editing] == "structure"
					eval("@editing = #{session[:editing].capitalize}.all")
        end
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
    
    def edit
			@sentence = Sentence.find(params[:id])
			session[:editing] = params[:field]
			puts session[:editing]
			unless session[:editing] == "structure"
				eval("@editing = #{session[:editing].capitalize}.all")
			end
			respond_to do |format|
					format.js
			end
    end
    
    private
        def sentence_params
            params.require('sentence').permit(:subject_id, :verb_id, :complement_id, :structure, :tense, :tense_modifier)
        end
    
end
