class MyDevise::InvitationsController < Devise::InvitationsController
  
  # the database says that this is working, but the request logs are still not permitting :first_name or :last_name...uh wtf?!
  before_filter :configure_permitted_parameters, only: :update
  # There are problems with this, they need to be resolved
  # before_filter :authorize_user
     
   def new_admin
     self.resource = resource_class.new()
   end
   
   def new_manager
     @gym = Gym.find(params[:id])
     self.resource = @gym.build_manager()
   end
   
   # POST /resource/invitation
   def create_admin
     self.resource = invite_admin
     resource_invited = resource.errors.empty?

     yield resource if block_given?

     if resource_invited
       if is_flashing_format? && self.resource.invitation_sent_at
         set_flash_message :notice, :send_instructions, :email => self.resource.email
       end
       respond_with resource, :location => after_invite_path_for(current_inviter)
     else
       respond_with_navigational(resource) { render :new }
     end
   end
     
     
   # POST /resource/invitation
   def create_manager
     gym = Gym.find(params[:user][:gym_id])
     self.resource = invite_manager
     gym.manager = self.resource
     gym.save!

     resource_invited = resource.errors.empty?

     yield resource if block_given?

     if resource_invited
       if is_flashing_format? && self.resource.invitation_sent_at
         set_flash_message :notice, :send_instructions, :email => self.resource.email
       end
       respond_with resource, :location => after_invite_path_for(current_inviter)
     else
       # respond_with_navigational(resource) { render :new }
       redirect_to new_manager_path(gym.id), alert: "Email is already taken."
     end
   end
   
   # PUT /resource/invitation
   def update
     respond_to do |format|
       format.js do
         invitation_token = Devise.token_generator.digest(resource_class, :invitation_token, update_resource_params[:invitation_token])
         self.resource = resource_class.where(invitation_token: invitation_token).first
         resource.skip_password = true
         resource.update_attributes update_resource_params.except(:invitation_token)
       end
       format.html do
         super
       end
     end
   end
      
   private
   
   def authorize_user
     authorize current_user
   end
   
   # Add :first_name and :last_name to permitted parameters
   def configure_permitted_parameters
     devise_parameter_sanitizer.for(:accept_invitation) do |u|
       u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :invitation_token,)
     end
   end
   
   def invite_admin
     resource_class.invite!(invite_params, current_inviter) do |invitable|
       invitable.add_role("admin")
     end
   end
   
   def invite_manager
     resource_class.invite!(invite_params, current_inviter) do |invitable|
       invitable.add_role("manager")
     end
   end
   
end