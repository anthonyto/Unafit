class Gym < ActiveRecord::Base
  validates :name, :email, :phone_number, :city, :state, :street, :zip, :description, 
            :two_gym_passes, :three_gym_passes, :four_gym_passes, presence: true
    
  has_many :subscriptions
  has_many :users, :through => :subscriptions
  has_many :pictures
  belongs_to :manager, class_name: "User", foreign_key: "user_id"
  geocoded_by :full_street_address
  after_validation :geocode
  before_save :capitalize_attributes
  
  def full_street_address
    address = "#{self.street} #{self.city} #{self.state} #{self.zip}"
    return address
  end
  
  # This is only if I decide to use native Google Maps api
  # Right now I am using GMaps4Rails. If that works out, then erase this method. I won't need it
  def build_markers(gyms)
    gyms_json = Hash.new
    gyms.each do |gym|
      gym_json = Hash.new
      gym_json[:id] = gym.id
      gym_json[:name] = gym.name
      gym_json[:street] = gym.street
      gym_json[:city] = gym.city
      gym_json[:state] = gym.state
      gym_json[:zip] = gym.zip
      gym_json[:latlng] = "#{gym.latitude}, #{gym.longitude}"
      # add gym_json into a nice hash
    end
  end
  
  private
  
  def capitalize_attributes
    self.name   = self.name.titleize
    self.street = self.street.titleize
    self.city   = self.city.titleize
    self.state  = self.state.upcase    
  end
  
end
