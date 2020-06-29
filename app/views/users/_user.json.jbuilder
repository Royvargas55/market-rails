json.extract! user, :id, :username, :about, :head, :financial, :created_at, :updated_at
json.url user_url(user, format: :json)
