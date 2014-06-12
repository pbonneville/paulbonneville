json.array!(@contents) do |content|
  json.extract! content, :id, :title, :platform, :role, :overview
  json.url admin_content_url(content, format: :json)
end
