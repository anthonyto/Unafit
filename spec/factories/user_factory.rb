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
    
    association :managed_gym, factory: :gym
  end
  
  factory :client, class: User do 
    email { Faker::Internet.email }
    first_name "Client"
    last_name "Bar"
    role 2
    password "password"
    password_confirmation "password"
    confirmed_at Date.today
    
    factory :client_with_client_profile do 
      client_profile 
      
      factory :client_with_subscriptions do
        transient do
          subscriptions_count 3
        end
        after(:create) do |client_with_subscriptions, evaluator|
          create_list(:subscription, evaluator.subscriptions_count, user: client_with_subscriptions)
        end
      end
    end
  end
  
end