class UsersController < ApplicationController
  before_action :require_user_logged_in!

  def index 
    @user = User.all
  end 

  def show 
    @user = User.find(:id);
  end

  def new 
    @user = User.new 
  end

  def create 
    @user = User.new(user_params)
    if @user.save

      session[:user_id] = @user.id
      redirect_to root_path, notice: "Account  successfully created!"
    else 
      render :new, status: :unprocessable_entity
    end
  end
    private 

    def user_params 
      params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end
end


