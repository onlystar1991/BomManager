class PartsController < ApplicationController
  before_action :set_part, only: [:show, :edit, :update, :destroy]
  # GET /parts
  # GET /parts.json
  def index
    @parts = Part.all
  end

  # GET /parts/1
  # GET /parts/1.json
  def show
    respond_to do |format|
      format.html { render :show, notice: 'Part was successfully updated.', status: :ok, location: @part }
      format.json {
        render json: {
          part: {
            id: @part.id,
            part_name: @part.part_name,
            part_description: @part.part_description,
            manufacturing_part: @part.manufacturing_part,
            darko_part_number: @part.darko_part_number,
            picture: @part.picture.url,
            attachfile: @part.specification_file_name,
            price: @part.price,
            category: @part.sub_category.part_category.name,
            firmware: @part.firmware.nil? ? "" : @part.firmware.number
          }
        },
        status: :ok
      }
    end
  end

  # GET /parts/new
  def new
    @part = Part.new
  end

  # GET /parts/1/edit
  def edit
  end

  # POST /parts
  # POST /parts.json
  def create
    @part = Part.new(part_params)
    respond_to do |format|
      if @part.save
        format.html { redirect_to @part, notice: 'Part was successfully created.' }
        format.json {
          render json: {
            status: "ok",
            part: {
              id: @part.id,
              name: @part.part_name,
              picture: @part.picture.url,
              category_id: @part.sub_category_id
            }
          },
          status: :ok
        }
      else
        format.html { render :new }
        format.json { render json: @part.errors.full_messages, status: :ok }
      end
    end
  end

  # PATCH/PUT /parts/1
  # PATCH/PUT /parts/1.json
  def update
    @part.update(part_params)
  end

  # DELETE /parts/1
  # DELETE /parts/1.json
  def destroy
    @part.destroy
    respond_to do |format|
      format.html { redirect_to parts_url, notice: 'Part was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_part
      @part = Part.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def part_params
      params.require(:part).permit(:part_name, :part_description, :manufacturing_part, :number, :darko_part_number, :price, :firmware_id, :sub_category_id, :picture)
    end

    def get_dependency
      @part_categories = PartCategory.all
      @firmwares = Firmware.all
    end
end
