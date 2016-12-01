class BomCategoriesController < ApplicationController
  before_action :set_bom_category, only: [:show, :edit, :update, :destroy]

  # GET /bom_categories
  # GET /bom_categories.json
  def index
    @bom_categories = BomCategory.all
  end

  # GET /bom_categories/1
  # GET /bom_categories/1.json
  def show
  end

  # GET /bom_categories/new
  def new
    @bom_category = BomCategory.new
  end

  # GET /bom_categories/1/edit
  def edit
  end

  # POST /bom_categories
  # POST /bom_categories.json
  def create
    @bom_category = BomCategory.new(bom_category_params)

    respond_to do |format|
      if @bom_category.save
        format.html { redirect_to @bom_category, notice: 'Bom category was successfully created.' }
        format.json {
          render json: {
            status: "ok",
            bom_category: {
              id: @bom_category.id,
              name: @bom_category.name,
              description: @bom_category.description,
              photo: @bom_category.photo.url
            }
          },
          status: :created
        }
      else
        format.html { render :new }
        format.json { render json: @bom_category.errors.full_messages, status: :ok }
      end
    end
  end

  # PATCH/PUT /bom_categories/1
  # PATCH/PUT /bom_categories/1.json
  def update
    respond_to do |format|
      if @bom_category.update(bom_category_params)
        format.html { redirect_to @bom_category, notice: 'Bom category was successfully updated.' }
        format.json { render :show, status: :ok, location: @bom_category }
      else
        format.html { render :edit }
        format.json { render json: @bom_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bom_categories/1
  # DELETE /bom_categories/1.json
  def destroy
    @bom_category.destroy
    respond_to do |format|
      format.html { redirect_to bom_categories_url, notice: 'Bom category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bom_category
      @bom_category = BomCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bom_category_params
      params.require(:bom_category).permit(:name, :description, :photo)
    end
end
