class Firmware < ApplicationRecord
	resourcify
	has_many :parts
	validates :number, :presence => true
end
