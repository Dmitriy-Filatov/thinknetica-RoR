# frozen_string_literal: true

class FeedbacksMailer < ApplicationMailer
  before_action { @mailer = params[:email] }

  default to: 'dev.prjcts@gmail.com',
          subject: -> { t('.subject') }

  def send_feedback(feedback)
    @feedback = feedback

    mail from: @mailer
  end
end
