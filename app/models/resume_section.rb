class ResumeSection < ActiveRecord::Base
	has_many :resume_entries

	validates :title, presence: true
end
