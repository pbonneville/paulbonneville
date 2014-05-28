class ChangeTypeToSkillTypeInSkillTagTypes < ActiveRecord::Migration
  def change
    rename_column :skill_tag_types, :type, :tagType
  end
end
