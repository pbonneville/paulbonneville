class BlogController < ApplicationController
  def index
	  @title = 'Blog'

	  if params.has_key?(:page)
		  @page                           = params[:page]
		  session[:pagination_page]       = @page
		  session[:pagination_controller] = controller_name
	  else
		  if session.has_key?(:pagination_page)
			  if (session[:pagination_controller] == controller_name)
				  @page = session[:pagination_page]
			  end
		  end
	  end

	  @entries = Admin::BlogEntry.where(:publish => true).paginate(:page => @page, :per_page => 10).order(:publish_at => :desc)
  end

	def show
		@entry = Admin::BlogEntry.find(params[:id]);
	end
end
