class HookController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
  end

  #same as send_grid_survery_created_callback
  def survery_created_callback
    begin
      results = params["hook"]["_json"][0]
      email_id = results["_id"]
      event = results["event"]
      email_info = EmailInfo.find_by_email_id(email_id)
      email_info.event_update(event)
    rescue Exception => e
    end
    render :nothing => true
  end

  def send_grid_survery_created_callback
    begin
      results = params["hook"]["_json"][0]
      email_id = results["_id"]
      event = results["event"]
      email_info = EmailInfo.find_by_email_id(email_id)
      email_info.event_update(event)
    rescue Exception => e
    end
    render :nothing => true
  end

  def mail_gun_survery_created_callback

    puts params
    
    begin
      results = JSON.parse(params)
      event =  results["event"]
      email_id = results["message-id"]
      email_info = EmailInfo.find_by_email_id(email_id)
      email_info.event_update(event)
    rescue Exception => e
      
    end
    render :nothing => true
  end

end

