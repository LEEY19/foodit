class LeadMailer < ApplicationMailer
	default from: ENV["APP_EMAIL"]

  def welcome_email(lead)
    @lead = lead
    @url = 'www.potacto.com'
    mail(to: @lead.email, bcc: "info.potacto-HFKKGJ@mailbox.insight.ly", from: 'info.potacto@gmail.com', subject: 'Thank you for joining the Potacto invite list :)')
  end
end
