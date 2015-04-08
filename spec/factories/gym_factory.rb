FactoryGirl.define do 
  factory :gym do 
    name "Cyc Fitness"
    email "foo@bar.com"
    phone_number "(858)383-7081"
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