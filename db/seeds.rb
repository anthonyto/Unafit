# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

gyms = [
  ["Capital Fitness", "foo@bar.com", "(858)383-7081", "Madison", "wi", "15 North Butler St", "53703", 8, 6, 4, "foobarfoo"],
  ["Anytime Fitness", "foo@bar.com", "(858)383-7081", "Madison", "wi", "301 East Campus Mall", "53715", 8, 6, 4, "foobarfoo" ],
  ["Princeton Club", "foo@bar.com", "(858)383-7081", "Madison", "wi", "1726 Eagan Road", "53704", 8, 6, 4, "foobarfoo"],
  ["Planet Fitness", "foo@bar.com", "(858)383-7081", "Monona", "wi", "2305 West Broadway", "53713", 8, 6, 4, "foobarfoo"],
  ["Cyc Fitness", "foo@bar.com", "(858)383-7081", "Madison", "wi", "773 University Avenue", "53715", 8, 6, 4, "foobarfoo"],
  ["Inner Fire Yoga", "foo@bar.com", "(858)383-7081", "Madison", "wi", "5003 University Avenue", "53705", 8, 6, 4, "foobarfoo"],
  ["La Fitness", "foo@bar.com", "(858)383-7081", "San Diego", "CA", "16913 Dove Canyon Road", "92127", 8, 6, 4, "foobarfoo"],
  ["24 Hour Fitness", "foo@bar.com", "(858)383-7081", "San Diego", "CA", "10025 Carmel Mountain Road", "92129", 8, 6, 4, "foobarfoo"],
  ["San Diego Fitness", "foo@bar.com", "(858)383-7081", "San Diego", "CA", "4206 Sorrento Valley", "92121", 8, 6, 4, "foobarfoo"],
  ["Chuze Fitness", "foo@bar.com", "(858)383-7081", "San Diego", "CA", "1233 Camino Del Rio", "92108", 8, 6, 4, "foobarfoo"],
  ["World Gym", "foo@bar.com", "(858)383-7081", "San Diego", "CA", "2949 Garnet Avenue", "92109", 8, 6, 4, "foobarfoo"]
]

gyms.each do |name, email, phone_number, city, state, street, zip, two_gym_passes, three_gym_passes, four_gym_passes, description|
  Gym.create!(
    name: name,
    email: email,
    phone_number: phone_number,
    city: city,
    state: state,
    street: street,
    zip: zip,
    two_gym_passes: two_gym_passes,
    three_gym_passes: three_gym_passes, 
    four_gym_passes: four_gym_passes, 
    description: description)
end

User.create!(email: "admin@bar.com", first_name: "anthony", last_name: "to", role: 0, password: "password");
user = User.create!(email: "manager@bar.com", first_name: "jeanie", last_name: "to", role: 1, password: "password");

gym = Gym.find(1)
gym.user = user
gym.save!

user = User.create!(
  email: "madisonclient@bar.com",
  first_name: "Madtown",
  last_name: "mingus", 
  role: 2,
  password: "password"
);

user.build_client_profile(
  phone_number: "(858)484-7081", 
  city: "Madison",
  state: "WI", 
  street: "20 N Broom St", 
  zip: "53703",
  last_payment: "2014-12-26 08:13:00",
  active: true
)
user.client_profile.save!

user = User.create!(
  email: "sdclient@bar.com",
  first_name: "san diego",
  last_name: "mingus", 
  role: 2,
  password: "password"
);

user.build_client_profile(
  phone_number: "(858)484-7081", 
  city: "San Diego",
  state: "CA", 
  street: "7960 Kathryn Crosby Court", 
  zip: "92127",
  last_payment: "2014-12-26 08:13:00",
  active: true
)
user.client_profile.save!
