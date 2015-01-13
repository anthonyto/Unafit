json.array!(@pictures) do |picture|
  json.extract! picture, :id, :file_name, :gym_id
  json.url picture_url(picture, format: :json)
end
