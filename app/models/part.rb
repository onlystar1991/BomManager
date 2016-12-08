class Part < ApplicationRecord
	belongs_to :firmware
	belongs_to :part_category

	has_attached_file :picture, default_url: "/photos/original/missing.png"
	
	has_attached_file :specification
	validates_attachment :specification, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

	validates :part_name, :presence => true
	validates :manufacturing_part, :presence => true
	validates :darko_part_number, :presence => true
	validates :price, :presence => true
	validates :firmware_id, :presence => true
	
	
	
	resourcify
end