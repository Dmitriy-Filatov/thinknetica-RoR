class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show; end

  def index
    @questions = @test.questions

    render plain: @questions.inspect
    # render inline: '<%= @questions.inspect %>'
  end

  def create
    question = Question.create(question_params)

    render plain: question.inspect
  end

  def destroy
    @question.destroy

    render plain: 'The question has been deleted.'
    # render html: '<h1>The question has been deleted.</h1>'.html_safe
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found.'
  end
end
