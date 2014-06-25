class Admin::BlogEntry < ActiveRecord::Base
	validates :title, :excerpt, presence: true
	validates :excerpt, length: { maximum: 255 }
end
