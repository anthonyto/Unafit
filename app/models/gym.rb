class Gym < ActiveRecord::Base
  validates :name, :email, :phone_number, :city, :state, :street, :zip, :description, 
            :two_gym_passes, :three_gym_passes, :four_gym_passes, presence: true
    
  has_many :subscriptions
  has_many :users, :through => :subscriptions
  belongs_to :user
  geocoded_by :full_street_address
  after_validation :geocode
  before_save :capitalize_attributes
  
  def full_street_address
    address = "#{self.street} #{self.city} #{self.state} #{self.zip}"
    return address
  end
  
  private
  
  def capitalize_attributes
    self.name   = self.name.titleize
    self.street = self.street.titleize
    self.city   = self.city.titleize
    self.state  = self.state.upcase    
  end
  
end
