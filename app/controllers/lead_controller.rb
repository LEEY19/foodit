class LeadController < ApplicationController

  def index
    @lead = Lead.new
  end
  
  def home
  end
  
  def merchant
    @lead = Lead.new
  end

  def foodies
    # if params[:go_foodies][:track_click] == "true"
    #   log_event("ButtonClick", "Diners", "To view diners page")
    # end
    @lead = Lead.new
  end

  def create
    @lead = Lead.new(lead_params)
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

  def form_submit
    respond_to do |format|
      format.js 
    end
  end

  private
  
  def lead_params
    params.require(:lead).permit(:email, :lead_type)
  end


end
