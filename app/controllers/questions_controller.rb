class QuestionsController < ApplicationController
  def new
    @survey = Survey.find(params[:survey_id])
    @questions = @survey.questions.new
    render :new
  end

  def create
    @survey = survey.find(params[:survey_id])
    @question = @survey.questions.new(question_params)
    if @question.save
      redirect_to survey_path(@survey)
    else
      render :new
    end
  end

  def show
    @survey = Survey.find(params[:survey_id])
    @question = Question.find(params[:id])
    render :show
  end

  # Other controller actions go here.

  private
    def question_params
      params.require(:question).permit(:name, :question_text)
    end
end