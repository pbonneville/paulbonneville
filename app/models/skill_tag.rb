class SkillTag < ActiveRecord::Base
  belongs_to :skill_tag_type
  has_and_belongs_to_many :resume_entries
end