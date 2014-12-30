class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :gym
  after_initialize :set_default_sessions_left
  # validates sessions_left, presence: true
  
  def set_default_sessions_left
    self.sessions_left = self.user.client_profile.number_of_sessions
  end
  
end
