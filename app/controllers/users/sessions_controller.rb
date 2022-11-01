class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
    flash[:notice] = t('.hello', greeting: name_or_email)
  end

  private

  def name_or_email
    current_user.first_name || current_user.email
  end
end
