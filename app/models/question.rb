class Question < ApplicationRecord
	belongs_to :bom
	has_many :multi_question
end
