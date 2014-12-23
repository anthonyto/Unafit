class ClientProfile < ActiveRecord::Base
  belongs_to :user
  
  def set_lat_lng
    self.lat = 1
    self.lng = 2
  end
end
