class User < ActiveRecord::Base
  validates :email, :first_name, :last_name, :role, presence: true
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  
  # Only set email confirmations in production, because they are annoying in dev
  if Rails.env.production?
    devise :invitable, :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :invitable
  else
    devise :invitable, :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :invitable
  end
  
  has_many :subscriptions
  has_many :gyms, :through => :subscriptions
  has_one :gym
  has_one :client_profile
  accepts_nested_attributes_for :client_profile
  
  before_save :capitalize_attributes
  
  
  # set roles, that correspond to integers in the database
  enum role: [:admin, :manager, :client]
  # set user to client by default if it is not set
  after_initialize :set_default_role, :if => :new_record?
  
  attr_writer :invitation_instructions
  
  # Admin Invitation Customizations
  
  # def deliver_invitation
  #  if @invitation_instructions.present?
  #    ::Devise.mailer.send(@invitation_instructions, self).deliver
  #  else
  #    super
  #  end
  # end

  # These do nothing right now, they both simply call invite!
  # But if you want to send different emails based on admin or manager, then you have to 
  # set these up.
  def self.invite_admin!(attributes={}, invited_by=nil)
    self.invite!(attributes, invited_by)
   # self.invite!(attributes, invited_by) do |invitable|
   #   invitable.invitation_instructions = :guest_invitation_instructions
   # end
  end

  def self.invite_manager!(attributes={}, invited_by=nil)
    self.invite!(attributes, invited_by)
   # self.invite!(attributes, invited_by) do |invitable|
   #   invitable.invitation_instructions = :friend_invitation_instructions
   # end
  end
  
  def set_default_role
    self.role ||= :client
  end
 
  def add_role(role)
    self.role = role
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
  
  def expires
    return 30.days.since(self.client_profile.last_payment)
  end
  
  def active?
    self.role == "client" && self.client_profile.active?
  end

  def active_and_subscribed?
    self.active? && !self.gyms.empty?
  end
  
  private 
  
  def capitalize_attributes
    self.first_name = self.first_name.capitalize
    self.last_name = self.last_name.capitalize
  end
  
  
end
