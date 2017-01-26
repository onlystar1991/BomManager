class Part < ApplicationRecord
	belongs_to :firmware
	belongs_to :sub_category
	has_attached_file :picture, default_url: "/photos/original/missing.png"
	
	has_attached_file :specification
	validates_attachment :specification, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

	validates :part_name, :presence => true
	
	validates :price, presence: true,
		numericality: true,
		format: { :with => /\A\d{1,4}(\.\d{0,2})?\z/ }

	validates :number, :uniqueness => {:scope => :sub_category_id}
	resourcify
end