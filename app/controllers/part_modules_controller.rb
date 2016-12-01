class PartModulesController < ApplicationController
  before_action :set_part_module, only: [:show, :edit, :update, :destroy]

  # GET /part_modules
  # GET /part_modules.json
  def index
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
        format.html { redirect_to @part_module, notice: 'Part module was successfully created.' }
        format.json { render :show, status: :created, location: @part_module }
      else
        format.html { render :new }
        format.json { render json: @part_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /part_modules/1
  # PATCH/PUT /part_modules/1.json
  def update
    respond_to do |format|
      if @part_module.update(part_module_params)
        format.html { redirect_to @part_module, notice: 'Part module was successfully updated.' }
        format.json { render :show, status: :ok, location: @part_module }
      else
        format.html { render :edit }
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
      params.require(:part_module).permit(:name)
    end
end
