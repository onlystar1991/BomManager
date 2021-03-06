class Bom < ApplicationRecord
	require 'csv'
	belongs_to :bom_category
	has_many :part_modules, dependent: :destroy 
	has_many :questions
	has_attached_file :photo, styles: { small: "64x64", medium: "94x95", large: "200x200"}
	
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
	validates :name, :presence => true
	validates :description, :presence => true
	# validates :purchase_order_number, :presence => true

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
			outputs = Hash.new

			self.part_modules.each do |part_item|
				if outputs.has_key? part_item.part.id
					outputs[part_item.part.id].push(part_item)
				else
					outputs[part_item.part.id] = []
					outputs[part_item.part.id].push(part_item)
				end
			end
			
			printed_part_category = ""
			changed = true
			headers = Hash.new
			final_outputs = Hash.new
			outputs.each do |key, output|
				if printed_part_category.eql? output[0].part.sub_category.part_category.name
					changed = false
				else
					printed_part_category = output[0].part.sub_category.part_category.name
					changed = true
				end

				header = ["Part Name", "Part Description", "Manufacturer Part Number", "Created At"]
				row = []
				row.push(output[0].part.part_name)
				row.push(output[0].part.part_description)
				row.push(output[0].part.number.empty? ? "" : output[0].part.number)
				row.push(output[0].part.created_at.to_date)
				output.each do | part_item |
					if header.include? "Cost@#{part_item.count}"
						next
					end
					if part_item.count > 2499
						per_piece_price = part_item.part.price_2500.to_f
					elsif part_item.count > 999
						per_piece_price = part_item.part.price_1000.to_f
					elsif part_item.count > 499
						per_piece_price = part_item.part.price_500.to_f
					elsif part_item.count > 249
						per_piece_price = part_item.part.price_250.to_f
					else
						per_piece_price = part_item.part.price.to_f
					end

					row.push("$#{per_piece_price}")
					header.push("Cost@#{part_item.count}")
				end
				headers[output[0].part.sub_category.part_category.name] = header

				if final_outputs.has_key? output[0].part.sub_category.part_category.name
					final_outputs[output[0].part.sub_category.part_category.name].push(row)
				else
					final_outputs[output[0].part.sub_category.part_category.name] = []
					final_outputs[output[0].part.sub_category.part_category.name].push(row)
				end
			end

			final_outputs.each do |key, final_result|
				csv << [key]
				csv << headers[key]
				final_result.each do |part|
					csv << part
				end
			end
		end
	end
end
