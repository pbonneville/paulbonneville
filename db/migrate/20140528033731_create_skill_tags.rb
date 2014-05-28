class CreateSkillTags < ActiveRecord::Migration
  def change
    create_table :skill_tags do |t|
      t.string :tag
      t.belongs_to :skill_tag_type
      t.timestamps
    end

    create_table :skill_tags_resume_entries do |t|
      t.belongs_to :skill_tag
      t.belongs_to :resume_entry
    end
  end
end
