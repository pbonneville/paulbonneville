json.array!(@skill_tags) do |skill_tag|
  json.extract! skill_tag, :id, :tag
  json.url skill_tag_url(skill_tag, format: :json)
end
