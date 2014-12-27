class User < ActiveRecord::Base
  validates :email, :first_name, :last_name, :role, presence: true
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  
  # Only set email confirmations in production, because they are annoying in dev
  if Rails.env.production?
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
  else
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
    # devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  end
  
  has_many :registrations
  has_many :gyms, :through => :registrations
  has_one :client_profile
  accepts_nested_attributes_for :client_profile
  
  # set roles, that correspond to integers in the database
  enum role: [:admin, :manager, :client]
  # set user to client by default if it is not set
  after_initialize :set_default_role, :if => :new_record?
  
  
  def set_default_role
    self.role ||= :client
  end
 
  def client? 
    self.role == "client"
  end
  
  def admin?
    self.role == "admin"
  end
  
  def manager?
    self.role == "manager"
  end
  
  # def create_profile
  #   profile = ClientProfile.create
  #   profile.client_id = self.id
  #   puts "Profile: #{profile}"
  # end
  
end
