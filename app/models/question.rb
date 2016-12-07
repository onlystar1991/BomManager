class Question < ApplicationRecord
	belongs_to :bom
	has_many :multi_questions

	validates :question, :presence => true
end
