class AddOrganizationUrlToResumeEntries < ActiveRecord::Migration
  def change
    add_column :resume_entries, :organizationURL, :string
  end
end
