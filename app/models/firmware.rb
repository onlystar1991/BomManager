class Firmware < ApplicationRecord
	resourcify
	has_many :parts
end
