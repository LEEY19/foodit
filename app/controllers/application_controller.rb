class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
  def log_event(category, action, label)
      session[:events] ||= Array.new
      session[:events] << {:category => category, :action => action, :label => label}
  end
end
