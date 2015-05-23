class GymPolicy < ApplicationPolicy
  attr_reader :current_user, :gym
  
  def initialize(current_user, gym)
    @current_user = current_user
    @gym          = gym
  end
  
  def new? 
    @current_user.admin?
  end
  
  def create? 
    @current_user.admin?
  end
  
  def check_in_client?
    @current_user.manager?
  end
  
  def update_sessions_left?
    @current_user.manager?
  end

  ## HOW CAN WE ENFORCE THAT A MANAGER CAN ONLY UPDATE THEIR OWN GYM???
  def edit? 
    # @gym.manager == @current_user
    @current_user.admin? or @current_user.manager?
  end
  
  def update?
    @current_user.admin? or @current_user.manager?
  end
  
  def destroy?
    @current_user.admin?
  end
  
end
