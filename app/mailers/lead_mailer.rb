class LeadMailer < ApplicationMailer
	default from: ENV["APP_EMAIL"]

  def welcome_email(lead)
    @lead = lead
    mail(to: @lead.email, subject: 'Thank you for choosing to stay in touch with Potacto :)')
  end
end
