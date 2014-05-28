class CreateResumeEntries < ActiveRecord::Migration
  def change
    create_table :resume_entries do |t|
      t.string :title
      t.string :organization
      t.string :location
      t.text :description
      t.integer :sortOrder

      t.timestamps
    end
  end
end
