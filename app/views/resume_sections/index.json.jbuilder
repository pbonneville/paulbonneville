json.array!(@resume_sections) do |resume_section|
  json.extract! resume_section, :id, :title, :sortOrder
  json.url resume_section_url(resume_section, format: :json)
end
