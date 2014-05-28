class CreateResumeSections < ActiveRecord::Migration
  def change
    create_table :resume_sections do |t|
      t.string :title
      t.integer :sortOrder

      t.timestamps
    end
  end
end
