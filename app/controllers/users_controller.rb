class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end


  def new
  	@user = User.new
  end
  
  def create
    @user = User.new(user_params)

    if @user.valid? && @user.save
      redirect_to users_path
    else
      render :new
    end
  end
  
  def confirm
    @user = User.where(id: params[:id], verification_token: params[:token]).first
    
    if @user
      @user.confirm!
      redirect_to root_path
    else
      redirect_to root_path, flash: {error: 'your token was invalid'}
    end
  end

  private
  
  # strong_parameters
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
