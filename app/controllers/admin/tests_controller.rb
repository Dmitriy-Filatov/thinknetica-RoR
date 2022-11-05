class Admin::TestsController < Admin::BaseController
  before_action :set_tests, only: %i[index update_inline]
  before_action :set_test, only: %i[show edit update update_inline destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index; end

  def show; end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.authored_tests.new(test_params)
    if @test.save
      redirect_to [:admin, @test], notice: t('.test_created')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test], notice: t('.test_updated')
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    if @test.destroy
      redirect_to admin_tests_path, notice: t('.test_deleted')
    else
      redirect_to admin_test_path(@test)
    end
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def set_tests
    @tests = Test.all
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def rescue_with_test_not_found
    render file: 'public/404.html', status: :not_found
  end
end
