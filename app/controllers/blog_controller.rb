class BlogController < ApplicationController
  def index
	  @title = 'Blog'
	  @entries = Admin::BlogEntry.where(:publish => true).order(:publish_at => :desc)
  end

	def show
		@entry = Admin::BlogEntry.find(params[:id]);
	end
end
