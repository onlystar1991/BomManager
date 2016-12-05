class StaticPagesController < ApplicationController
	layout 'main'
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

	end
end
