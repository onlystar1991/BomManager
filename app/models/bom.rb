class Bom < ApplicationRecord
	belongs_to :bom_category

	has_many :part_modules
	has_many :questionnaires
end
