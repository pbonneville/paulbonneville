class HomeController < ApplicationController
  def index
    @title = 'Home'
	 @entries = Admin::BlogEntry.where(:publish => true).where(:featured => true).order(:publish_at => :desc).limit(3)
  end
end
