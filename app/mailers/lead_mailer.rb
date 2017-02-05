class LeadMailer < ApplicationMailer
  def welcome_email(lead)
    @lead = lead
    @url = 'www.potacto.com'
    mail(to: @lead.email, from: 'info.potacto@gmail.com', subject: 'Thank you for expressing interest towards Potacto :)')
  end
end
