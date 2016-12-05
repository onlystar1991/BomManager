class MultiQuestionsController < ApplicationController
  before_action :set_multi_question, only: [:show, :edit, :update, :destroy]

  # GET /multi_questions
  # GET /multi_questions.json
  def index
    @multi_questions = MultiQuestion.all
  end

  # GET /multi_questions/1
  # GET /multi_questions/1.json
  def show
  end

  # GET /multi_questions/new
  def new
    @multi_question = MultiQuestion.new
  end

  # GET /multi_questions/1/edit
  def edit
  end

  # POST /multi_questions
  # POST /multi_questions.json
  def create
    @multi_question = MultiQuestion.new(multi_question_params)

    respond_to do |format|
      if @multi_question.save
        format.html { redirect_to @multi_question, notice: 'Multi question was successfully created.' }
        format.json { render :show, status: :created, location: @multi_question }
      else
        format.html { render :new }
        format.json { render json: @multi_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /multi_questions/1
  # PATCH/PUT /multi_questions/1.json
  def update
    respond_to do |format|
      if @multi_question.update(multi_question_params)
        format.html { redirect_to @multi_question, notice: 'Multi question was successfully updated.' }
        format.json { render :show, status: :ok, location: @multi_question }
      else
        format.html { render :edit }
        format.json { render json: @multi_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /multi_questions/1
  # DELETE /multi_questions/1.json
  def destroy
    @multi_question.destroy
    respond_to do |format|
      format.html { redirect_to multi_questions_url, notice: 'Multi question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multi_question
      @multi_question = MultiQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def multi_question_params
      params.require(:multi_question).permit(:text_answer, :selected, :question_id)
    end
end
