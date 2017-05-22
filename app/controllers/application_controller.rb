require 'rest_client'

class ApplicationController < ActionController::Base
  # protect_from_forgery with: :null_session

  protected

  def join_invite_button(category, action, label, client_id = '555')
    params = {
      v: 1,
      tid: "UA-91685349-1",
      cid: client_id,
      t: "event",
      ec: category,
      ea: action,
      el: label
    }
    begin
      RestClient.get("https://www.google-analytics.com/collect", params: params, timeout: 4, open_timeout: 4)
      return true
    rescue  RestClient::Exception => rex
      return false
    end
  end

end
