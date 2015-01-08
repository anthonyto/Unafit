class MyDevise::InvitationsController < Devise::InvitationsController
     
   def new_admin
     self.resource = resource_class.new()
   end
   
   def new_manager
     @gym = Gym.find(params[:id])
     self.resource = @gym.build_user()
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
     gym.user = self.resource
     gym.save!

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
   
   # GET /resource/invitation/accept?invitation_token=abcdef
   def edit
     resource.invitation_token = params[:invitation_token]
     # user = User.where(invitation_token: params[:invitation_token]).first
     # if user.role == 1
     #   render :edit_manager
     # else
     #   render :edit_admin
     # end
     render :edit
   end
     
   def update
     self.resource = accept_resource
     invitation_accepted = resource.errors.empty?

     yield resource if block_given?

     if invitation_accepted
       flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
       set_flash_message :notice, flash_message if is_flashing_format?
       sign_in(resource_name, resource)
       respond_with resource, :location => after_accept_path_for(resource)
     else
       respond_with_navigational(resource){ render :edit }
     end
   end
   
   private
   
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