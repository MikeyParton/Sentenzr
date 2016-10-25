class Definition < ApplicationRecord
	belongs_to :definable, polymorphic: true
	has_many :translations, as: :translatable
end