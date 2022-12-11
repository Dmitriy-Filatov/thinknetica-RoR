# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: %( 'Admin TestGuru' <dev.allmyprjcts@gmail.com> )
  layout 'mailer'
end
