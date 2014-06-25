class SkillTagType < ActiveRecord::Base
  has_many :skill_tags

  validates :tagType, presence: true
end
