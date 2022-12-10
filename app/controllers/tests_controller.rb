class TestsController < ApplicationController
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def start
    @test = Test.find(params[:id])

    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def rescue_with_test_not_found
    render file: 'public/404.html', status: :not_found
  end
end
