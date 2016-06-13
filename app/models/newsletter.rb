class Newsletter < ActiveRecord::Base
  def deliver
    sleep 10
    update_attribute(:delivered_at, Time.zone.now)
  end

end
