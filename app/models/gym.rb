class Gym < ActiveRecord::Base
  has_many :registrations
  has_many :users, :through => :registrations
  geocoded_by :full_street_address
  after_validation :geocode
  
  def full_street_address
    address = "#{self.street} #{self.city} #{self.state} #{self.zip}"
    return address
  end
  
end
