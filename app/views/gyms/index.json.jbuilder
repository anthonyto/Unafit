json.array!(@gyms) do |gym|
  json.extract! gym, :id, :name, :email, :phone_number, :city, :state, :street, :lat, :lng, :2_gym_passes, :3_gym_passes, :4_gym_passes, :status, :description, :link, :profile_image, :logo_image, :showers, :classes, :reservation_policy
  json.url gym_url(gym, format: :json)
end
