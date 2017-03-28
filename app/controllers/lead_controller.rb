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

  def thank_you
    if params[:pricing][:pricing_type] == "free"
      gon.event_tracker = {category: "Pay", action: "Free", label: ""}
    elsif params[:pricing][:pricing_type] == "usd15"
      gon.event_tracker = {category: "Pay", action: "Usd15", label: ""}
    else
      gon.event_tracker = {category: "Pay", action: "Usd25", label: ""}
    end
  end

  def create
    @lead = Lead.new(lead_params)
    if @lead.lead_type == "foodie"
      join_invite_button("Join Invite List", "ClickedButton", "")
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
    else
      # gon.event_tracker = {category: "Get Started", action: "ClickedButton", label: ""}
      join_invite_button("Get Started", "ClickedButton", "")
      if @lead.save
        LeadMailer.welcome_email(@lead).deliver_later
        redirect_to lead_pricing_path
      else
        @error = @lead.errors.full_messages.first
        if @error == "Email is invalid" 
          respond_to do |format|
            @error
            format.js 
          end
        else
          redirect_to lead_pricing_path
        end
      end
    end
  end

  def pricing
  end

  def query_community
    @communities = ["Bandar Puteri", "Bandar Putra", "Bandar Klang", "Bandar Bomb", "Tropicana Golf and Country Club", "USJ 11/4", "KGSAAS - Greenville"]
    render json: @communities
  end

  def query_unit
    @units = ["23, USJ11/4B", "12, USJ11/4C", "22, USJ11/4B"]
    render json: @units
  end

  private
  
  def lead_params
    params.require(:lead).permit(:email, :lead_type)
  end


end
