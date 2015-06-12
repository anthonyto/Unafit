FactoryGirl.define do 
  factory :gym do 
    name { Faker::Company.name }
    email { Faker::Internet.email }
    phone_number { Faker::PhoneNumber.phone_number }
    city "Madison"
    state "WI"
    street "773 University Avenue"
    zip "57315"
    two_gym_passes 8
    three_gym_passes 6
    four_gym_passes 4
    description "foobarfoo"
  end
end 