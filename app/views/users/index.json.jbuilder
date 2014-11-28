json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :email, :phone_number, :city, :state, :street, :zip, :lat, :lng, :type, :number_of_sessions
  json.url user_url(user, format: :json)
end
