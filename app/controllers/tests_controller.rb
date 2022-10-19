class TestsController < ApplicationController
  before_action :set_test, only: %i[show edit update destroy start]
  before_action :set_user, only: :start

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test, notice: 'Test created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to @test, notice: 'Test updated.'
    else
      render :edit
    end
  end

  def destroy
    if @test.destroy
      redirect_to tests_path, notice: 'Test destroyed.'
    else
      redirect_to @test
    end
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def set_user
    @user = User.first
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :user_id)
  end

  def rescue_with_test_not_found
    render file: '/Users/dmitriy/Documents/ror/test-guru/public/404.html', layout: false, status: :not_found
  end
end
