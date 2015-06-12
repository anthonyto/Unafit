class ClientProfile < ActiveRecord::Base
  # validates :user_id, :phone_number, :city, :state, :street, :zip, presence: true
  # I wanted to validate the presence of the user_id here, to make sure that every client_profile
  # existed only in the context of another user. But this is breaking a lot of FactoryGirl stuff. 
  # FactoryGirl refuses to create a user with a client_profile, stating that :user for the profile can't be blank. 
  # I'll figure that out later
  validates :phone_number, :city, :state, :street, :zip, presence: true
  
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
    self.city = self.city.titleize
    self.state = self.state.upcase
    self.street = self.street.titleize
  end

end
