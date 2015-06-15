class GymPolicy < ApplicationPolicy
  attr_reader :current_user, :gym
  
  def initialize(current_user, gym)
    @current_user = current_user
    @gym          = gym
  end
  
  def index
    @current_user.admin? or @current_user.manager? or @current_user.client?
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

  def edit? 
    @current_user.admin? or @current_user.manager?
  end
  
  def update?
    @current_user.admin? or @current_user.manager?
  end
  
  def destroy?
    @current_user.admin?
  end
  
end
