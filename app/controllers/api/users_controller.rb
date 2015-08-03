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
      message = user.errors.full_messages.join(', ')
      render_error messages: message
    end
  end

  def update
    user = User.find(params[:id])
    
    if user.update_attributes(user_params)
      render json: user
    else
      render_error messages: user.errors.full_messages.join(', ')
    end
  end
  
  private
  
  # strong_parameters
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end