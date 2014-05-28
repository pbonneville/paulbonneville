class ResumeController < ApplicationController
  def index
    @title = 'Resume'
    @sections = ResumeSection.all
  end
end
