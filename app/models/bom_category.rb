class BomCategory < ApplicationRecord
	resourcify

	has_attached_file :photo, styles: { small: "64x64", medium: "94x95", large: "200x200"}
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/


	validates :name, :presence => true
	has_many :boms
end
