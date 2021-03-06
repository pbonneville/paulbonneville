class Admin::ResumeEntriesController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_resume_entry, only: [:show, :edit, :update, :destroy]

	layout 'admin'

	# GET /resume_entries
	# GET /resume_entries.json
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
			WillPaginate.per_page = (params[:per_page] == t(:all)) ? ResumeEntry.count : params[:per_page]
		else
			if (!defined? WillPaginate.per_page)
				WillPaginate.per_page = Constants::PAGINATION_PER_PAGE_AMOUNTS.first
			end
		end

		@resume_entries = ResumeEntry.paginate(:page => @page, :per_page => WillPaginate.per_page).order(:resume_section_id).order(:sortOrder)
	end

	# GET /resume_entries/1
	# GET /resume_entries/1.json
	def show
		@resume_entry_skill_tags = @resume_entry.skill_tags.order('LOWER(tag)');
	end

	# GET /resume_entries/new
	def new
		@resume_entry = ResumeEntry.new
	end

	# GET /resume_entries/1/edit
	def edit
	end

	# POST /resume_entries
	# POST /resume_entries.json
	def create
		@resume_entry = ResumeEntry.new(resume_entry_params)

		respond_to do |format|
			if @resume_entry.save
				format.html { redirect_to edit_admin_resume_entry_path(@resume_entry), notice: 'Resume entry was successfully created.' }
				format.json { render :show, status: :created, location: @resume_entry }
			else
				format.html { render :new }
				format.json { render json: @resume_entry.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /resume_entries/1
	# PATCH/PUT /resume_entries/1.json
	def update
		respond_to do |format|
			if @resume_entry.update(resume_entry_params)
				format.html { redirect_to :edit_admin_resume_entry, notice: 'Resume entry was successfully updated.' }
				format.json { render :show, status: :ok, location: @resume_entry }
			else
				format.html { render :edit }
				format.json { render json: @resume_entry.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /resume_entries/1
	# DELETE /resume_entries/1.json
	def destroy
		@resume_entry.destroy
		respond_to do |format|
			format.html { redirect_to admin_resume_entries_url, notice: 'Resume entry was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_resume_entry
		@resume_entry = ResumeEntry.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def resume_entry_params
		params[:resume_entry].permit(:title, :organization, :organizationURL, :timeframe, :location, :description, :sortOrder, :resume_section_id, skill_tag_ids: [])
	end
end
