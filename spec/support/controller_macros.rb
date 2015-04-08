# This is stuff for devise signing in. More in spec/support/devise.rb. Got this from here
# https://github.com/plataformatec/devise/wiki/How-To:-Test-controllers-with-Rails-3-and-4-%28and-RSpec%29

module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in FactoryGirl.create(:admin) # Using factory girl as an example
    end
  end
  
  def login_manager
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:manager]
      user = FactoryGirl.create(:manager)
      user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in manager
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:client]
      user = FactoryGirl.create(:client)
      user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in client
    end
  end
end