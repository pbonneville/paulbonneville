class Admin::ContentsController < ApplicationController
		before_filter :authenticate_user!
		before_action :set_content, only: [:show, :edit, :update, :destroy]

		layout 'admin'

		# GET /contents
		# GET /contents.json
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
				WillPaginate.per_page = (params[:per_page] == t(:all)) ? PortfolioEntry.count : params[:per_page]
			else
				if (!defined? WillPaginate.per_page)
					WillPaginate.per_page = Constants::PAGINATION_PER_PAGE_AMOUNTS.first
				end
			end
			@contents = Content.paginate(:page => @page, :per_page => WillPaginate.per_page)
		end

		# GET /contents/1
		# GET /contents/1.json
		def show
		end

		# GET /contents/new
		def new
			@content = Content.new
		end

		# GET /contents/1/edit
		def edit
		end

		# POST /contents
		# POST /contents.json
		def create
			@content = Content.new(content_params)

			respond_to do |format|
				if @content.save
					format.html { redirect_to edit_admin_content_path(@content), notice: 'Content was successfully created.' }
					format.json { render :show, status: :created, location: @content }
				else
					format.html { render :new }
					format.json { render json: @content.errors, status: :unprocessable_entity }
				end
			end
		end

		# PATCH/PUT /contents/1
		# PATCH/PUT /contents/1.json
		def update
			respond_to do |format|
				if @content.update(content_params)
					format.html { redirect_to :edit_admin_content, notice: 'Content was successfully updated.' }
					format.json { render :show, status: :ok, location: @content }
				else
					format.html { render :edit }
					format.json { render json: @content.errors, status: :unprocessable_entity }
				end
			end
		end

		# DELETE /contents/1
		# DELETE /contents/1.json
		def destroy
			@content.destroy
			respond_to do |format|
				format.html { redirect_to admin_contents_url, notice: 'Content was successfully destroyed.' }
				format.json { head :no_content }
			end
		end

		private
		# Use callbacks to share common setup or constraints between actions.
		def set_content
			@content = Content.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def content_params
			params.require(:content).permit(:title, :content)
		end
	end

