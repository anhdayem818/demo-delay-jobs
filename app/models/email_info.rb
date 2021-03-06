class EmailInfo < ActiveRecord::Base
  def opened
    self.update_attribute(:is_open, true)
  end

  def clicked
    self.update_attribute(:is_click, true)    
  end

  def event_update(event)
    case event
    when "open", "opened"
      self.opened
    when "click", "clicked"
      self.clicked
    end  
  end

end
