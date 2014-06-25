class Admin::SkillTagsController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_skill_tag, only: [:show, :edit, :update, :destroy]

	layout 'admin'

	# GET /skill_tags
	# GET /skill_tags.json
	def index
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

		if params.has_key?(:per_page)
			WillPaginate.per_page = (params[:per_page] == t(:all)) ? SkillTag.count : params[:per_page]
		else
			if (!defined? WillPaginate.per_page)
				WillPaginate.per_page = Constants::PAGINATION_PER_PAGE_AMOUNTS.first
			end
		end
		@skill_tags = SkillTag.paginate(:page => @page, :per_page => WillPaginate.per_page).order("skill_tag_type_id ASC, tag ASC")
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
				format.html { redirect_to edit_admin_skill_tag_path(@skill_tag), notice: 'Skill tag was successfully created.' }
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
				format.html { redirect_to :edit_admin_skill_tag, notice: 'Skill tag was successfully updated.' }
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
			format.html { redirect_to admin_skill_tags_url, notice: 'Skill tag was successfully destroyed.' }
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
