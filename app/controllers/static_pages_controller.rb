class StaticPagesController < ApplicationController
	layout 'main'

	require 'google_drive'
	require "googleauth"

	def index
		@current_user = current_user
		@user = User.new

		@part_category = PartCategory.new
		@users = User.paginate(:page => params[:page], :per_page => 5)

		@active_tab = params[:page] ? false : true
		@part_categories = PartCategory.all

		@part = Part.new
		@bom_category = BomCategory.new

		@bom_categories = BomCategory.all
		@bom = Bom.new

		@question = Question.new
		@firmware = Firmware.new

		@sub_category = SubCategory.new
	end

	def import_from_google
		session = GoogleDrive::Session.from_config("config.json")
		ws = session.spreadsheet_by_key("1EyiEv1s2YdvM8-npFupSmco5N0G9seGT-tFskqguS6A").worksheets

		i = 0;

		(1..ws.count - 1).each do |row|
			work_sheet = ws[row];
			if PartCategory.exists?(name: work_sheet.title)
				part_category =	PartCategory.find_by(name: work_sheet.title)
			else
				part_category =	PartCategory.create!(name: work_sheet.title)
			end

			@flag = true
			(3..work_sheet.num_rows).each do |row|
				if work_sheet[row, 1].blank? and work_sheet[row, 1].blank?
					@flag = true
					next
				end

				if @flag
					@sub = part_category.sub_categories.create(name: work_sheet[row, 1])
					@sub = SubCategory.find_by(name: work_sheet[row, 1]) if !@sub.save
					@flag = false;
				else
					part = @sub.parts.create(part_name: work_sheet[row, 1],
								part_description: work_sheet[row, 2],
								number: work_sheet[row, 4],
								price: work_sheet[row, 8].split("$")[1],
								price_250: work_sheet[row, 9].split("$")[1],
								price_500: work_sheet[row, 10].split("$")[1],
								price_1000: work_sheet[row, 11].split("$")[1],
								price_2500: work_sheet[row, 12].split("$")[1],
								price_5000: work_sheet[row, 13].split("$")[1]
							)
					if part.save
						i = i + 1
					else
						puts '>>>>>>>>>>>>>>>>>>>>>>>>>'
						puts part.errors.full_messages
					end
				end
			end
		end
		flash[:notice] = "#{i} items imported from google sheet";
		redirect_to root_path
	end
end
