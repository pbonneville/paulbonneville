class Admin::SkillTagTypesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_skill_tag_type, only: [:show, :edit, :update, :destroy]

  layout 'admin'

  # GET /skill_tag_types
  # GET /skill_tag_types.json
  def index
    @skill_tag_types = SkillTagType.all.order(:sortOrder)
  end

  # GET /skill_tag_types/1
  # GET /skill_tag_types/1.json
  def show
  end

  # GET /skill_tag_types/new
  def new
    @skill_tag_type = SkillTagType.new
  end

  # GET /skill_tag_types/1/edit
  def edit
  end

  # POST /skill_tag_types
  # POST /skill_tag_types.json
  def create
    @skill_tag_type = SkillTagType.new(skill_tag_type_params)

    respond_to do |format|
      if @skill_tag_type.save
        format.html { redirect_to :edit_admin_skill_tag_type, notice: 'Skill tag type was successfully created.' }
        format.json { render :show, status: :created, location: @skill_tag_type }
      else
        format.html { render :new }
        format.json { render json: @skill_tag_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skill_tag_types/1
  # PATCH/PUT /skill_tag_types/1.json
  def update
    respond_to do |format|
      if @skill_tag_type.update(skill_tag_type_params)
        format.html { redirect_to :edit_admin_skill_tag_type, notice: 'Skill tag type was successfully updated.' }
        format.json { render :show, status: :ok, location: @skill_tag_type }
      else
        format.html { render :edit }
        format.json { render json: @skill_tag_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skill_tag_types/1
  # DELETE /skill_tag_types/1.json
  def destroy
    @skill_tag_type.destroy
    respond_to do |format|
      format.html { redirect_to admin_skill_tag_types_url, notice: 'Skill tag type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill_tag_type
      @skill_tag_type = SkillTagType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skill_tag_type_params
      params.require(:skill_tag_type).permit(:tagType, :sortOrder)
    end
end
