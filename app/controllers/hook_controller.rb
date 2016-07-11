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
    begin
      event =  params["event"]
      email_id = params["message-id"]
      email_info = EmailInfo.find_by_email_id(email_id)
      email_info.event_update(event)
    rescue Exception => e
      
    end
    render :nothing => true
  end

  def elastic_mail_survery_created_callback
    begin
      results = params
      email_id = results["transaction"]
      event = results["status"]
      email_info = EmailInfo.find_by_email_id("ElasticEmail_#{email_id}")
      email_info.event_update(event)
    rescue Exception => e
    end
    render :nothing => true
  end
end

