json.array!(@managers) do |manager|
  json.extract! manager, :id, :gym_name
  json.url manager_url(manager, format: :json)
end
