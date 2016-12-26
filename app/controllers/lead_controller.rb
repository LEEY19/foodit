class LeadController < ApplicationController

  def index
    @lead = Lead.new
  end
  
  def create
    byebug
  end

  private
  
  def lead_params
    params.require(:lead).permit(:name, :email, :comments)
  end


end
