class UserPolicy
  attr_reader :current_user, :user
  
  def initialize(current_user, user)
    @current_user = current_user
    @user         = user
  end
  
  def index?
    @current_user.admin?
  end
  
  def new?
    @current_user.admin?
  end
  
  def edit_registrations?
    @current_user.client? && @current_user.paid?
  end
  
end
