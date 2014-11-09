json.array!(@users) do |user|
  json.extract! user, :id, :screen_name, :full_name, :email, :description, :url
  json.url user_url(user, format: :json)
end
