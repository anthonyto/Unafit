class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  
  # Only set email confirmations in production, because they are annoying in dev
  if Rails.env.production?
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
  else
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  end
  
  
  
         
    
   
 
end
