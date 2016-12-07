class PartModulesController < ApplicationController
  before_action :set_part_module, only: [:show, :edit, :update, :destroy]

  # GET /part_modules
  # GET /part_modules.json
  def index
    # @part = PartModule.build_part
    @part_modules = PartModule.all
  end

  # GET /part_modules/1
  # GET /part_modules/1.json
  def show
  end

  # GET /part_modules/new
  def new
    @part_module = PartModule.new
  end

  # GET /part_modules/1/edit
  def edit
  end

  # POST /part_modules
  # POST /part_modules.json
  def create

    @part_module = PartModule.new(part_module_params)


    respond_to do |format|
      if @part_module.save
        format.json { 
          render json: {
            status: 'ok',
            part_module: {
              id: @part_module.id,
              part_name: @part_module.part.part_name,
              count: @part_module.count,
              price: @part_module.part.price,
              firmware: @part_module.part.firmware.number,
              photo: @part_module.part.picture.url
            }
          },
          status: :ok
        }
      else
        format.json { render json: @part_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /part_modules/1
  # PATCH/PUT /part_modules/1.json
  def update
    
    respond_to do |format|
      if @part_module.increment!(:count)
        format.json { 
          render json: {
            status: 'ok',
            part_module: {
              part_name: @part_module.part.part_name,
              count: @part_module.count,
              price: @part_module.part.price
            }
          },
          status: :ok
        }
      else
        format.json { render json: @part_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /part_modules/1
  # DELETE /part_modules/1.json
  def destroy
    @part_module.destroy
    respond_to do |format|
      format.html { redirect_to part_modules_url, notice: 'Part module was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_part_module
      @part_module = PartModule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def part_module_params
      params.require(:part_module).permit(:name, :part_id, :bom_id, :count)
    end
end
