class ClientProfile < ActiveRecord::Base
  validates :user_id, :phone_number, :city, :state, :street, :zip, presence: true
  
  belongs_to :user
  geocoded_by :full_street_address
  after_validation :geocode
  
  def full_street_address
    address = "#{self.street} #{self.city} #{self.state} #{self.zip}"
    return address
  end
  
end
