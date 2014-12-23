class GymPolicy
  attr_reader :current_user, :gym
  
  def initialize(current_user, gym)
    @current_user = current_user
    @gym          = gym
  end
  
  def index?
  end
  
  def show?
  end
  
  def new_manager?
    @current_user.admin?
  end
  
  def update?
    @current_user.admin? or @current_user.manager?
  end
  
  def destroy?
    @current_user.admin?
  end
  
end
