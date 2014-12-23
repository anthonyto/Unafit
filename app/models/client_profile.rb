class ClientProfile < ActiveRecord::Base
  belongs_to :user
  
  def set_lat_lng
    # hit google maps api here and set lat lng
  end
end
