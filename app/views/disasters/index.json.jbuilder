json.array!(@disasters) do |disaster|
  json.extract! disaster, :id, :title, :desc, :original_id
  json.url disaster_url(disaster, format: :json)
end
