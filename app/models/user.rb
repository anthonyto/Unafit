class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  
  # Only set email confirmations in production, because they are annoying in dev
  if Rails.env.production?
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
  else
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  end
  
  # a manager can have only one gym
  # a client can have many gyms
  has_and_belongs_to_many :gyms
  
  # set roles, that correspond to integers in the database
  enum role: [:admin, :manager, :client]
  # set user to client by default if it is not set
  after_initialize :set_default_role, :if => :new_record?
  
  
  def set_default_role
    self.role ||= :client
  end
 
end
