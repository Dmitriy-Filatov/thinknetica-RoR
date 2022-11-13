class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def start
    if @test.questions.present?
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test)
    else
      redirect_to root_path, notice: "Sorry, Test doesn't consist any question"
    end
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render file: 'public/404.html', status: :not_found
  end
end
