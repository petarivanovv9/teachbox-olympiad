class QuickAnswersController < ApplicationController
  # GET /quick_answers
  # GET /quick_answers.json
  def index
    @quick_answers = QuickAnswer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quick_answers }
    end
  end

  # GET /quick_answers/new
  # GET /quick_answers/new.json
  def new
    @quick_answer = QuickAnswer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quick_answer }
    end
  end

  # POST /quick_answers
  # POST /quick_answers.json
  def create
    @quick_answer = QuickAnswer.new(params[:quick_answer])
    @quick_answer.quick_question_id = params[:quick_question_id]
    @quick_answer.user_id = params[:user_id]
    @quick_answer.save
    
    respond_to do |format|
      if @quick_answer.save
        format.html { redirect_to :back }
        format.json { render json: @quick_answer, status: :created, location: @quick_answer }
      else
        format.html { render action: "new" }
        format.json { render json: @quick_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quick_answers/1
  # DELETE /quick_answers/1.json
  def destroy
    @quick_answer = QuickAnswer.find(params[:id])
    @quick_answer.destroy

    respond_to do |format|
      format.html { redirect_to quick_answers_url }
      format.json { head :no_content }
    end
  end
end
