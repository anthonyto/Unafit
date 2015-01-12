class ClientProfile < ActiveRecord::Base
  validates :user_id, :phone_number, :city, :state, :street, :zip, presence: true
  
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
    self.state = self.state.titleize
    self.street = self.street.titleize
  end

end
