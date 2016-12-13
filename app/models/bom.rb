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
		attributes = %w{id name description}
		CSV.generate(headers: true) do |csv|
			csv << attributes
			csv << [self.id, self.name, self.description]
			csv << ["Part Items"]
			csv << ["Part Name", "Firmware", "Count", "Price"]
			self.part_modules.each do |part_item|
				csv << [part_item.part.part_name, part_item.part.firmware.nil? ? "" : part_item.part.firmware.number, part_item.count, part_item.part.price * part_item.count]
			end
			csv << ["Questions"]
			csv << ["Question", "Answer"]
			self.questions.each do |question|
				if question.question_type == 2
					multi = [question.question]
					question.multi_questions.each do |mul|
						multi << mul.text_answer 
						multi << mul.selected ? "Yes" : "No"
					end
					csv << multi
				elsif question.question_type == 1
					csv << [question.question, question.choice_answer ? "Yes" : "No"]
				else
					csv << [question.question, question.text_answer]
				end
			end
		end
	end
end
