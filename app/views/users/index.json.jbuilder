json.array!(@users) do |user|
  json.extract! user, :id, :email, :approved
  json.url user_url(user, format: :json)
end
