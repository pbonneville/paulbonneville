json.array!(@skill_tag_types) do |skill_tag_type|
  json.extract! skill_tag_type, :id, :tagType
  json.url skill_tag_type_url(skill_tag_type, format: :json)
end
