class Bom < ApplicationRecord
	belongs_to :bom_category

	has_many :part_modules
	has_many :questions

	has_attached_file :photo, styles: { small: "64x64", medium: "94x95", large: "200x200"}
	
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
	validates :name, :presence => true
	validates :description, :presence => true
	validates :purchase_order_number, :presence => true
end
