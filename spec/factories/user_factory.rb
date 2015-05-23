FactoryGirl.define do
  factory :admin, class: User do
    email { Faker::Internet.email }
    first_name "Admin"
    last_name "Bar"
    role 0
    password "password"
    password_confirmation "password"
    confirmed_at Date.today
  end
  
  factory :manager, class: User do 
    email { Faker::Internet.email }
    first_name "Manager"
    last_name "Bar"
    role 1
    password "password"
    password_confirmation "password"
    confirmed_at Date.today
    
    gym
  end
  
  factory :client, class: User do 
    email { Faker::Internet.email }
    first_name "Client"
    last_name "Bar"
    role 2
    password "password"
    password_confirmation "password"
    confirmed_at Date.today
    
    # client_profile { create(:client_profile) }
    before(:create) do |client|
       # client.client_profile ||= FactoryGirl.build(:client_profile, user: client)
       FactoryGirl.build(:client_profile, user_id: client) 
   end
  end
  
end