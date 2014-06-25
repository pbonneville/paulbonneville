class PortfolioEntry < ActiveRecord::Base
	before_save :destroy_image?

	belongs_to :portfolio_platform
	has_and_belongs_to_many :skill_tags
	has_attached_file :project_image, styles: {
		thumb: '340x170>',
		full:  '970x485>'
	},                :default_url            => "/img/thumb.jpg"

	validates_attachment_content_type :project_image, :content_type => /\Aimage\/.*\Z/
	validates :title, :portfolio_platform_id, presence: true;

	def project_image_delete
		@project_image_delete ||= "0"
	end

	def project_image_delete=(value)
		@project_image_delete = value
	end

	private
	def destroy_image?
		self.project_image.clear if @project_image_delete == "1"
	end

end
