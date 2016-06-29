class HookController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:index, :survery_created_callback]

  def index
  end

  def survery_created_callback
    begin
      puts params["hook"]["_json"]
      results = params["hook"]["_json"][0]
      email_id = results["_id"]
      event = results["event"]
      email_info = EmailInfo.find_by_email_id(email_id)
      break unless email_info.present?
      case event
      when "open"
        email_info.opened
      when "click"
        email_info.clicked
      end
    rescue Exception => e
    end
    render :nothing => true
    
  end

end
