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
    @lead = Lead.new
  end

  def create
    @lead = Lead.new(lead_params)
    if @lead.save
      LeadMailer.welcome_email(@lead).deliver_later
      respond_to do |format|
        format.js 
      end
    else
      @error = @lead.errors.full_messages.first
      respond_to do |format|
        @error
        format.js 
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
