class Admin::ResumeSectionsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_resume_section, only: [:show, :edit, :update, :destroy]

  layout 'admin'

  # GET /resume_sections
  # GET /resume_sections.json
  def index
    @resume_sections = ResumeSection.all.order(:sortOrder)
  end

  # GET /resume_sections/1
  # GET /resume_sections/1.json
  def show
  end

  # GET /resume_sections/new
  def new
    @resume_section = ResumeSection.new
  end

  # GET /resume_sections/1/edit
  def edit
  end

  # POST /resume_sections
  # POST /resume_sections.json
  def create
    @resume_section = ResumeSection.new(resume_section_params)

    respond_to do |format|
      if @resume_section.save
        format.html { redirect_to :edit_admin_resume_section, notice: 'Resume section was successfully created.' }
        format.json { render :show, status: :created, location: @resume_section }
      else
        format.html { render :new }
        format.json { render json: @resume_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resume_sections/1
  # PATCH/PUT /resume_sections/1.json
  def update
    respond_to do |format|
      if @resume_section.update(resume_section_params)
        format.html { redirect_to :edit_admin_resume_section, notice: 'Resume section was successfully updated.' }
        format.json { render :show, status: :ok, location: @resume_section }
      else
        format.html { render :edit }
        format.json { render json: @resume_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resume_sections/1
  # DELETE /resume_sections/1.json
  def destroy
    @resume_section.destroy
    respond_to do |format|
      format.html { redirect_to admin_resume_sections_url, notice: 'Resume section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resume_section
      @resume_section = ResumeSection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resume_section_params
      params[:resume_section].permit(:title, :sortOrder)
    end
end
