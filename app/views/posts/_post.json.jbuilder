json.extract! post, :id, :name, :body, :published, :created_at, :updated_at
json.url post_url(post, format: :json)
