class UserPolicy
  attr_reader :current_user, :user
  
  def initialize(current_user, user)
    @current_user = current_user
    @user         = user
  end
  
  def index?
    @current_user.admin? or @current_user.manager?
  end
  
  def show? 
    @current_user.admin? or @current_user.manager? or @current_user.client?
  end
  
  def edit_subscriptions?
    @current_user.client? and @current_user.client_profile.active?
  end
  
  def update_subscriptions?
    @current_user.client? and @current_user.client_profile.active?
  end
  
  def destroy?
    @current_user.admin?
  end
  
end
