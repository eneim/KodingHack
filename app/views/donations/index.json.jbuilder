json.array!(@donations) do |donation|
  json.extract! donation, :id, :amount, :country, :user_id, :disaster_id
  json.url donation_url(donation, format: :json)
end
