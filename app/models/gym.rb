class Gym < ActiveRecord::Base
  validates :name, :email, :phone_number, :city, :state, :street, :zip, :description, 
            :two_gym_passes, :three_gym_passes, :four_gym_passes, presence: true
  
  has_many :subscriptions
  has_many :users, :through => :subscriptions
  geocoded_by :full_street_address
  after_validation :geocode
  
  def full_street_address
    address = "#{self.street} #{self.city} #{self.state} #{self.zip}"
    return address
  end
  
end
