class LeadMailer < ApplicationMailer
  def welcome_email(lead)
    @lead = lead
    mail(to: @lead.email, from: 'no-reply@potacto.com', subject: 'Thank you for choosing to stay in touch with Potacto :)')
  end
end
