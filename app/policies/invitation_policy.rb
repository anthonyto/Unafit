class InvitationPolicy
  attr_reader :current_user
  
  def initialize(current_user)
    @current_user = current_user
  end

  def new_admin
    @current_user.admin?
  end
  
  def new_manager
    @current_user.admin?
  end
  
  def create_admin
    @current_user.admin?
  end
  
  def create_manager
    @current_user.admin?
  end
  
end
