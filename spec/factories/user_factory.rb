FactoryGirl.define do
  factory :admin, class: User do
    email "admin@bar.com"
    first_name "Anthony"
    last_name "To"
    role 0
    password "password"
  end
  
  factory :manager, class: User do 
    email "manager@bar.com"
    first_name "Anthony"
    last_name "To"
    role 1
    password "password"
    
    gym
  end
  
  factory :client, class: User do 
    email "madisonclient@bar.com"
    first_name "Madtown"
    last_name "Foo"
    role 2
    password "password"
    
    client_profile
  end
end