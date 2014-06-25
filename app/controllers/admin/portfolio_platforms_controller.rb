class Admin::PortfolioPlatformsController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_portfolio_platform, only: [:show, :edit, :update, :destroy]

	layout 'admin'

	# GET /portfolio_platforms
	# GET /portfolio_platforms.json
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
			WillPaginate.per_page = (params[:per_page] == t(:all)) ? PortfolioPlatform.count : params[:per_page]
		else
			if (!defined? WillPaginate.per_page)
				WillPaginate.per_page = Constants::PAGINATION_PER_PAGE_AMOUNTS.first
			end
		end
		@portfolio_platforms = PortfolioPlatform.paginate(:page => @page, :per_page => WillPaginate.per_page).order(:sortOrder)
	end

	# GET /portfolio_platforms/1
	# GET /portfolio_platforms/1.json
	def show
	end

	# GET /portfolio_platforms/new
	def new
		@portfolio_platform = PortfolioPlatform.new
	end

	# GET /portfolio_platforms/1/edit
	def edit
	end

	# POST /portfolio_platforms
	# POST /portfolio_platforms.json
	def create
		@portfolio_platform = PortfolioPlatform.new(portfolio_platform_params)

		respond_to do |format|
			if @portfolio_platform.save
				format.html { redirect_to edit_admin_portfolio_platform_path(@portfolio_platform), notice: 'Portfolio platform was successfully created.' }
				format.json { render :show, status: :created, location: @portfolio_platform }
			else
				format.html { render :new }
				format.json { render json: @portfolio_platform.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /portfolio_platforms/1
	# PATCH/PUT /portfolio_platforms/1.json
	def update
		respond_to do |format|
			if @portfolio_platform.update(portfolio_platform_params)
				format.html { redirect_to :edit_admin_portfolio_platform, notice: 'Portfolio platform was successfully updated.' }
				format.json { render :show, status: :ok, location: @portfolio_platform }
			else
				format.html { render :edit }
				format.json { render json: @portfolio_platform.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /portfolio_platforms/1
	# DELETE /portfolio_platforms/1.json
	def destroy
		@portfolio_platform.destroy
		respond_to do |format|
			format.html { redirect_to admin_portfolio_platforms_url, notice: 'Portfolio platform was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_portfolio_platform
		@portfolio_platform = PortfolioPlatform.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def portfolio_platform_params
		params.require(:portfolio_platform).permit(:title, :sortOrder)
	end
end
