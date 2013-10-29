class UsersController < ApplicationController
  skip_before_action  :require_login, only: [:new,  :create]

  # GET /users/new
  def new
    @user = User.new
  end

 
  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        user = User.find_by_email(user_params[:email])
        session[:user_id] = user.id
        format.html { redirect_to carts_url, notice: 'Signed up!' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name)
    end
end
