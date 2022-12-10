# frozen_string_literal: true

class FeedbacksController < ApplicationController
  respond_to :html

  def new
  end

  def create
    email = feedback_params[:email]

    if feedback_params[:body].present? && email.present? && URI::MailTo::EMAIL_REGEXP.match?(email)
      FeedbacksMailer.with(email: email).send_feedback(feedback_params).deliver_now
      redirect_to root_path, notice: t('.success')
    else
      flash.now[:alert] = t('.failure')
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:body, :email, :first_name, :last_name)
  end
end
