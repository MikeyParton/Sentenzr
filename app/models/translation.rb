class Translation < ApplicationRecord
	belongs_to :translatable, polymorphic: true
	
	enum language: [:spanish, :simple_english]
	
end