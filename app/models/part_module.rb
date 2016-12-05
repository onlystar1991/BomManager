class PartModule < ApplicationRecord
	has_one :part
	belongs_to :bom
end