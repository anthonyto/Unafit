# This is stuff for devise signing in. More in spec/support/devise.rb. Got this from here
# https://github.com/plataformatec/devise/wiki/How-To:-Test-controllers-with-Rails-3-and-4-%28and-RSpec%29

module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in FactoryGirl.create(:admin)
    end
  end
  
  def login_manager
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:manager]
      sign_in FactoryGirl.create(:manager)
    end
  end

  def login_client
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:client]
      sign_in FactoryGirl.create(:client)
    end
  end
end