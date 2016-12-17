class StaticPagesController < ApplicationController
	layout 'main'

	require 'google_drive'
	require "googleauth"

	def index
		credentials = Google::Auth::UserRefreshCredentials.new(
			client_id: "980508681652-aabtrkd65tt9ask0lm54ne5e2pk8uaqq.apps.googleusercontent.com",
			client_secret: "kGBTWFzUxdmDm9DUESmG4Dpu",
			scope: [
				"https://www.googleapis.com/auth/drive",
				"https://spreadsheets.google.com/feeds/",
			],
			redirect_uri: "http://example.com/redirect"
		)

		session = GoogleDrive::Session.from_config("config.json")
		ws = session.spreadsheet_by_key("1EyiEv1s2YdvM8-npFupSmco5N0G9seGT-tFskqguS6A").worksheets[0]

		(1..ws.num_rows).each do |row|
			puts '-----------------'
			(1..ws.num_cols).each do |col|
				p ws[row, col]
			end
			puts '+++++++++++++++'
		end
		
		# auth_url = credentials.authorization_uri

		# puts '-----------------'
		# puts credentials.inspect
		# puts '-----------------'

		# ws = session.spreadsheet_by_key("1EyiEv1s2YdvM8-npFupSmco5N0G9seGT-tFskqguS6A").worksheets[0]

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
end
