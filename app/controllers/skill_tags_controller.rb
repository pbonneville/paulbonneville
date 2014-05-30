class SkillTagsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_skill_tag, only: [:show, :edit, :update, :destroy]

  layout 'admin'

  # GET /skill_tags
  # GET /skill_tags.json
  def index
  @skill_tags = SkillTag.all.order("skill_tag_type_id ASC, tag ASC")
  end

  # GET /skill_tags/1
  # GET /skill_tags/1.json
  def show
  end

  # GET /skill_tags/new
  def new
    @skill_tag = SkillTag.new
  end

  # GET /skill_tags/1/edit
  def edit
  end

  # POST /skill_tags
  # POST /skill_tags.json
  def create
    @skill_tag = SkillTag.new(skill_tag_params)

    respond_to do |format|
      if @skill_tag.save
        format.html { redirect_to @skill_tag, notice: 'Skill tag was successfully created.' }
        format.json { render :show, status: :created, location: @skill_tag }
      else
        format.html { render :new }
        format.json { render json: @skill_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skill_tags/1
  # PATCH/PUT /skill_tags/1.json
  def update
    respond_to do |format|
      if @skill_tag.update(skill_tag_params)
        format.html { redirect_to @skill_tag, notice: 'Skill tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @skill_tag }
      else
        format.html { render :edit }
        format.json { render json: @skill_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skill_tags/1
  # DELETE /skill_tags/1.json
  def destroy
    @skill_tag.destroy
    respond_to do |format|
      format.html { redirect_to skill_tags_url, notice: 'Skill tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill_tag
      @skill_tag = SkillTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skill_tag_params
      params.require(:skill_tag).permit(:tag, :skill_tag_type_id)
    end
end
