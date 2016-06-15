class HookController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:index, :survery_created_callback]

  def index
  end

  def survery_created_callback
    # If the body contains the survey_name parameter...
    # if params[:survery_name].present?
    #   # Create a new Survey object based on the received parameters...
    #   survey = Survey.new(:name => params[:survey_name]
    #   survey.url = params[:survey_url]
    #   survey.creator_email = params[:survey_creator_email]
    #   survey.save!
    # end

    # # The webhook doesn't require a response but let's make sure
    # # we don't send anything
    puts params["hook"]
    render :nothing => true

  end

end
