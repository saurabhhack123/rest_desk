class Api::UsersController < Api::ApiController
	def index
	  users = User.all
    render json:users 
	end

	def show
    user = User.find(params[:id])
    render json: user
	end

  def create
    user = User.new(user_params)
    
    if user.valid? && user.save
      render json: user
    else
      render_error
    end
  end

  
  private
  
  # strong_parameters
  def users_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
