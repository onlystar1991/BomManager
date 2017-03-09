class BomsController < ApplicationController
  before_action :set_bom, only: [:show, :edit, :update, :destroy]
  
  # GET /boms
  # GET /boms.json
  def index
    @boms = Bom.all
  end

  # GET /boms/1
  # GET /boms/1.json
  def show
    boms = Bom.all
    respond_to do |format|
      format.csv { send_data @bom.to_csv, filename: "bom-#{@bom.id}-#{Date.today}.csv" }
      format.pdf {
        pdf = CombinePDF.new
        @bom.part_modules.each do |part_module|
          pdf << CombinePDF.load(part_module.part.specification.path)
        end

        pdf.save "combined.pdf"
        send_data pdf.to_pdf, filename: "bom-#{@bom.id}-#{@bom.name}-#{Date.today}.pdf", type: "application/pdf"
      }
      format.html { render :show}
    end
  end

  # GET /boms/new
  def new
    @bom = Bom.new
  end

  # GET /boms/1/edit
  def edit
  end

  # POST /boms
  # POST /boms.json
  def create
    @bom = Bom.new(bom_params)

    respond_to do |format|
      if @bom.save
        format.html { redirect_to @bom, notice: 'Bom was successfully created.' }
        format.json {
          render json: {
            status: "ok",
            bom: {
              id: @bom.id,
              name: @bom.name,
              description: @bom.description,
              photo: @bom.photo.url,
              purchase_order_number: @bom.purchase_order_number,
              bom_category_id: @bom.bom_category_id
            }
          },
          status: :created
        }
      else
        format.html { render :new }
        format.json { render json: @bom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boms/1
  # PATCH/PUT /boms/1.json
  def update
    @bom.update(bom_params)
  end

  # DELETE /boms/1
  # DELETE /boms/1.json
  def destroy
    @bom.destroy
    respond_to do |format|
      format.html { redirect_to boms_url, notice: 'Bom was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bom
      @bom = Bom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bom_params
      params.require(:bom).permit(:name, :description, :bom_category_id, :photo, :purchase_order_number)
    end
end
