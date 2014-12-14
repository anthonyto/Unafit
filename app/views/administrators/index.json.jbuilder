json.array!(@administrators) do |administrator|
  json.extract! administrator, :id, :email, :first_name, :last_name
  json.url administrator_url(administrator, format: :json)
end
