class SessionsController < ApplicationController

  skip_before_action :authenticate_user!

  def new; end

  def create
    user = User.find_by(email: params[:email]&.downcase)

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies.delete(:redirect_user) || tests_path
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please.'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: 'You are logout, bye!'
  end
end
