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
    @email = params[:lead][:email]
    # @lead = Lead.new(lead_params)
    # if @lead.save
    #   LeadMailer.welcome_email(@lead).deliver_now
    respond_to do |format|
      @email
      format.js 
    end
    # else
    #   render 'new'
    # end
  end

  def form_submit
    respond_to do |format|
      format.js 
    end
  end

  private
  
  def lead_params
    params.require(:lead).permit(:name, :email, :comments)
  end


end
