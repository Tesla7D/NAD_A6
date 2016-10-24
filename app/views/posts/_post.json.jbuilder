json.extract! post, :id, :title, :html, :css, :created_at, :updated_at
json.url post_url(post, format: :json)