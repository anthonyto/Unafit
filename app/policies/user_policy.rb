class UserPolicy
  attr_reader :current_user, :user
  
  def initialize(current_user, user)
    @current_user = current_user
    @user         = user
  end
  
  def index?
    @current_user.admin? or @current_user.manager?
  end
  
  def new?
    @current_user.admin?
  end
  
  def edit_subscriptions?
    @current_user.client? and @current_user.client_profile.active?
  end
  
end
