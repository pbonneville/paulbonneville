class ResumeEntry < ActiveRecord::Base
  belongs_to :resume_section
  has_and_belongs_to_many :skill_tags
  accepts_nested_attributes_for :skill_tags, :allow_destroy => true
end
