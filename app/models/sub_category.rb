class SubCategory < ApplicationRecord
	belongs_to :part_category
	has_many :parts, dependent: :destroy 
	validates :name, :uniqueness => { :scope => :part_category_id }
end
