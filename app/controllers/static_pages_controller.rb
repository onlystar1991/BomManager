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
	end

	def import_from_google
		session = GoogleDrive::Session.from_config("config.json")
		ws = session.spreadsheet_by_key("1EyiEv1s2YdvM8-npFupSmco5N0G9seGT-tFskqguS6A").worksheets[0]
		i = 0;

		(3..161).each do |row|
			part = Part.new(part_name: ws[row, 1],
							part_description: ws[row, 2],
							number: ws[row, 3],
							price: ws[row, 6].split("$")[1],
							price_250: ws[row, 7].split("$")[1],
							price_500: ws[row, 8].split("$")[1],
							price_1000: ws[row, 9].split("$")[1],
							price_2500: ws[row, 10].split("$")[1],
							price_5000: ws[row, 11].split("$")[1]
							)
			puts '++++++++++++'
			puts part.number.inspect
			puts "+++++++++++++"
			# i = i + 1  if part.save
			if part.save
				i = i + 1
			else 
				puts part.errors.full_messages
			end
		end
		flash[:notice] = "#{i} items imported from google sheet";
		redirect_to root_path
	end
end
