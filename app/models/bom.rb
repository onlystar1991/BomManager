class Bom < ApplicationRecord
	require 'csv'
	belongs_to :bom_category
	has_many :part_modules, dependent: :destroy 
	has_many :questions
	has_attached_file :photo, styles: { small: "64x64", medium: "94x95", large: "200x200"}
	
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
	validates :name, :presence => true
	validates :description, :presence => true
	validates :purchase_order_number, :presence => true

	def to_csv
		CSV.generate(headers: true) do |csv|
			csv << [self.name]
			csv << [self.description]
			csv << [self.bom_category.name]
			csv << [self.created_at.to_date]
			csv << []
			# puts ">>>>>>>>>>> Dates <<<<<<<<<<<<<<<<<"
			# puts self.created_at.to_date
			self.part_modules.order('part_module.part.sub_category.part_category.name')
			# outputs = Hash.new
			self.part_modules.each do |part_item|
				csv << [part_item.part.sub_category.part_category.name]
				csv << ["Part Name", "Part Description", "Manufacturer Part Number", "Qty", "Price", "Created At"]
				csv << [part_item.part.part_name, part_item.part.description, part_item.part.number, part_item.count, part_item.part.price, part_item.part.created_at.to_date]
			end
		end
	end
end
