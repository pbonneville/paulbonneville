json.array!(@resume_entries) do |resume_entry|
  json.extract! resume_entry, :id, :title, :organization, :location, :description, :sortOrder, :belongs_to
  json.url admin_resume_entry_url(resume_entry, format: :json)
end
