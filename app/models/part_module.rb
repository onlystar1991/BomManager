class PartModule < ApplicationRecord
	belongs_to :part
	belongs_to :bom
end