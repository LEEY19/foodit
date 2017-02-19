class LeadController < ApplicationController

  def index
    @lead = Lead.new
  end
  
  def home
  end
  
  def merchant
    if request.referer != nil && URI(request.referer).path == "/"
      gon.event_tracker = {category: "ButtonClick", action: "Merchants", label: "To view merchants page"}
    end
    @lead = Lead.new
  end

  def foodies
    if request.referer != nil && URI(request.referer).path == "/"
      gon.event_tracker = {category: "ButtonClick", action: "Diners", label: "To view diners page"}
    end
    @lead = Lead.new
  end

  def create
    @lead = Lead.new(lead_params)
    if @lead.lead_type == "foodies"
      join_invite_button("Join Invite List", "ClickedButton", "")
    end
    if @lead.save
      LeadMailer.welcome_email(@lead).deliver_later
      redirect_to 'https://docs.google.com/forms/d/e/1FAIpQLScpTOsUuHJeMQZg27Uya7dqo_9F18mgARhU3f-IwroAYykqpg/viewform?c=0&w=1'
      # respond_to do |format|
      #   format.js 
      # end
    else
      @error = @lead.errors.full_messages.first
      if @error == "Email is invalid" 
        respond_to do |format|
          @error
          format.js 
        end
      else
        redirect_to 'https://docs.google.com/forms/d/e/1FAIpQLScpTOsUuHJeMQZg27Uya7dqo_9F18mgARhU3f-IwroAYykqpg/viewform?c=0&w=1'
      end
    end
  end

  # def form_submit
  #   respond_to do |format|
  #     format.js 
  #   end
  # end

  private
  
  def lead_params
    params.require(:lead).permit(:email, :lead_type)
  end


end
