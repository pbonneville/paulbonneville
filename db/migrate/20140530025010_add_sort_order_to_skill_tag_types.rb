class AddSortOrderToSkillTagTypes < ActiveRecord::Migration
  def change
    change_table :skill_tag_types do |t|
      t.integer :sortOrder
    end
  end
end
