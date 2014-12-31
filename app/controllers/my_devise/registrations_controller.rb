class MyDevise::RegistrationsController < Devise::RegistrationsController
    
  # def new_admin
  #   build_resource({role: "admin"})
  #   set_minimum_password_length
  #   yield resource if block_given?
  #   respond_with self.resource
  # end
  #
  # def create_admin
  #   build_resource(sign_up_params)
  #
  #    resource_saved = resource.save
  #    yield resource if block_given?
  #    if resource_saved
  #      if resource.active_for_authentication?
  #        set_flash_message :notice, :signed_up if is_flashing_format?
  #        sign_up(resource_name, resource)
  #        respond_with resource, location: after_sign_up_path_for(resource)
  #      else
  #        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
  #        expire_data_after_sign_in!
  #        respond_with resource, location: after_inactive_sign_up_path_for(resource)
  #      end
  #    else
  #      clean_up_passwords resource
  #      set_minimum_password_length
  #      respond_with resource
  #    end
  # end
  
  # GET /resource/sign_up
  def new_admin
    # build_resource({})
    @user = User.new(role: "admin")
    # set_minimum_password_length
    # yield resource if block_given?
    respond_with self.resource
  end

  # POST /resource
  def create_admin
    @user = User.new(sign_up_params)

    # yield resource if block_given?
    if @user.save
      redirect_to show_user(current_user)
      # if resource.active_for_authentication?
      #   set_flash_message :notice, :signed_up if is_flashing_format?
      #   sign_up(resource_name, resource)
      #   respond_with resource, location: after_sign_up_path_for(resource)
      # else
      #   set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
      #   expire_data_after_sign_in!
      #   respond_with resource, location: after_inactive_sign_up_path_for(resource)
      # end
    else
      clean_up_passwords resource
      # set_minimum_password_length
      respond_with resource
    end
  end
    
end