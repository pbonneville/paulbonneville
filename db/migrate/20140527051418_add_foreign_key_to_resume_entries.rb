class AddForeignKeyToResumeEntries < ActiveRecord::Migration
  def change
    change_table :resume_entries do |t|
      t.integer :resume_section_id
    end
  end
end
