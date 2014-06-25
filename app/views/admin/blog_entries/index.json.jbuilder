json.array!(@admin_blog_entries) do |admin_blog_entry|
  json.extract! admin_blog_entry, :id, :title, :excerpt, :body, :publish, :publish_at
  json.url admin_blog_entry_url(admin_blog_entry, format: :json)
end
