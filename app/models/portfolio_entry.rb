class PortfolioEntry < ActiveRecord::Base
  belongs_to :portfolio_platform

  before_save :destroy_image?

  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :project_image, styles: {
      thumb: '340x170>',
      full: '970x485>'
  }, :default_url => "/img/thumb.jpg"

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :project_image, :content_type => /\Aimage\/.*\Z/

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
