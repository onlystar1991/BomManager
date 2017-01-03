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

		first_ws = ws[1];

		if PartCategory.exists?(name: first_ws.title)
			part_category =	PartCategory.find_by(name: first_ws.title)
		else
			part_category =	PartCategory.create!(name: first_ws.title)
		end

		i = 0;
		@flag = true
		(3..first_ws.num_rows).each do |row|
			if first_ws[row, 1].blank? and first_ws[row, 1].blank?
				@flag = true
				next
			end

			if @flag
				@sub = part_category.sub_categories.create(name: first_ws[row, 1])
				@sub = SubCategory.find_by(name: first_ws[row, 1]) if !@sub.save
				@flag = false;
			else
				part = @sub.parts.create(part_name: first_ws[row, 1],
							part_description: first_ws[row, 2],
							number: first_ws[row, 4],
							price: first_ws[row, 8].split("$")[1],
							price_250: first_ws[row, 9].split("$")[1],
							price_500: first_ws[row, 10].split("$")[1],
							price_1000: first_ws[row, 11].split("$")[1],
							price_2500: first_ws[row, 12].split("$")[1],
							price_5000: first_ws[row, 13].split("$")[1]
						)
				if part.save
					i = i + 1
				else 
					puts part.errors.full_messages
				end
			end
		end
		
		puts "-------------End Worksheets------------"
		
		flash[:notice] = "#{i} items imported from google sheet";
		redirect_to root_path
	end
end
