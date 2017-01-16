class LeadController < ApplicationController

  def index
    @lead = Lead.new
  end
  
  def create
    @lead = Lead.new(lead_params)
    if @lead.save
      # LeadMailer.welcome_email(@lead).deliver_now
      respond_to do |format|
        format.js 
      end
    else
      render 'new'
    end
  end

  private
  
  def lead_params
    params.require(:lead).permit(:name, :email, :comments)
  end


end
