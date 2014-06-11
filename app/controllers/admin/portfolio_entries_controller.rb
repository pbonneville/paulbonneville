class Admin::PortfolioEntriesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_portfolio_entry, only: [:show, :edit, :update, :destroy]

  layout 'admin'

  # GET /portfolio_entries
  # GET /portfolio_entries.json
  def index
    @portfolio_entries = PortfolioEntry.all
  end

  # GET /portfolio_entries/1
  # GET /portfolio_entries/1.json
  def show
		@portfolio_entry_skill_tags = @portfolio_entry.skill_tags.order('LOWER(tag)');
  end

  # GET /portfolio_entries/new
  def new
    @portfolio_entry = PortfolioEntry.new
  end

  # GET /portfolio_entries/1/edit
  def edit
  end

  # POST /portfolio_entries
  # POST /portfolio_entries.json
  def create
    @portfolio_entry = PortfolioEntry.new(portfolio_entry_params)

    respond_to do |format|
      if @portfolio_entry.save
        format.html { redirect_to url_for([:admin, @portfolio_entry]), notice: 'Portfolio entry was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio_entry }
      else
        format.html { render :new }
        format.json { render json: @portfolio_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolio_entries/1
  # PATCH/PUT /portfolio_entries/1.json
  def update
    respond_to do |format|
      if @portfolio_entry.update(portfolio_entry_params)
        format.html { redirect_to url_for([:admin, @portfolio_entry]), notice: 'Portfolio entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_entry }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolio_entries/1
  # DELETE /portfolio_entries/1.json
  def destroy
    @portfolio_entry.destroy
    respond_to do |format|
      format.html { redirect_to admin_portfolio_entries_url, notice: 'Portfolio entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_entry
      @portfolio_entry = PortfolioEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_entry_params
      params.require(:portfolio_entry).permit(:title, :portfolio_platform_id, :role, :overview, :sortOrder, :project_image, :project_image_delete, :backgroundColor, skill_tag_ids:[])
    end
end
