class Admin::AnswersController < Admin::BaseController
  before_action :set_question, only: %i[new create]
  before_action :set_answer, only: %i[show edit update destroy]

  def show; end

  def new
    @answer = @question.answers.new
  end

  def edit; end

  def create
    @answer = @question.answers.new(answer_params)
    if @answer.save
      redirect_to admin_answer_path(@answer), notice: t('.answer_created')
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to admin_answer_path(@answer), notice: t('.answer_updated')
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to admin_question_path(@answer.question), notice: t('.answer_deleted')
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.reqire(:answer).permit(:boby, :correct)
  end
end
