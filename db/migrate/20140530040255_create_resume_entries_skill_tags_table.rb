class CreateResumeEntriesSkillTagsTable < ActiveRecord::Migration
  def change
    create_table :resume_entries_skill_tags do |t|
      t.belongs_to :resume_entry
      t.belongs_to :skill_tag
    end
  end
end
