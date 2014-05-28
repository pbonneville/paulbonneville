class CreateSkillTagTypes < ActiveRecord::Migration
  def change
    create_table :skill_tag_types do |t|
      t.string :type

      t.timestamps
    end
  end
end
