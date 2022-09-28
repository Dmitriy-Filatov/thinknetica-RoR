class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  # 'R' (Read) of CRUD
  def index
    @questions = @test.questions

    render plain: @questions.inspect
    # render inline: '<%= @questions.inspect %>'
  end

  def show
    @question = Question.find(params[:id])
  end

  # 'C' (Create) of CRUD
  def new; end

  def create
    question = Question.create(question_params)
    @question_id = question.id
  end

  # 'U' (Update) of CRUD
  def edit
    @question = :find_question
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # 'D' (Delete) of CRUD
  def destroy
    @question.destroy
    redirect_to root_path
    render plain: 'The question has been deleted.'
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body).to_h.merge(test_id: params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found.'
  end
end
