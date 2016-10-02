Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root "sentences#show"
    resources :sentences do
    	resources :subjects
        get 'subject_options', :on => :member
        get 'verb_options', :on => :member
        get 'complement_options', :on => :member
    end
end
