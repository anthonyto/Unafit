# This is stuff for devise signing in. More in spec/support/devise.rb. Got this from here
# https://github.com/plataformatec/devise/wiki/How-To:-Test-controllers-with-Rails-3-and-4-%28and-RSpec%29

module ControllerMacros
  
  def login(type)
    before(:each) do
      @user = FactoryGirl.create(type)
      @request.env["devise.mapping"] = Devise.mappings[type]
      sign_in @user
    end
  end
  
end