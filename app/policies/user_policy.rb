
class UserPolicy
  attr_reader :current_user, :user
  
  def initialize(current_user, user)
    @current_user = current_user
    @user          = user
  end
  
  def index?
    @current_user.admin?
  end
  
  def show_client
    @current_user.client?
  end
  
  def show_manager
    @current_user.manager?
  end
  
  def show_admin
    @current_user.admin?
  end
  
  def update?
    @current_user.admin?
  end
  
  def destroy?
    @current_user.admin?
  end
  
end
