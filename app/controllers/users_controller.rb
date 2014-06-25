class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  layout 'admin'

  # GET /users
  # GET /users.json
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
	 @users = User.paginate(:page => @page, :per_page => WillPaginate.per_page).order(:email)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @previously_approved = @user.approved
    respond_to do |format|
      if @user.update(user_params)
        if (@previously_approved == false && @user.approved == true)
          AdminMailer.new_user_approved(@user).deliver
        end
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :approved)
    end
end
