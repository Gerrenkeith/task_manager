class SessionsController < ApplicationController
    # app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def new
    # Renders the login form
  end

  def create
    user = User.find_by(email: params[:email])

    # Authenticate the user's password using has_secure_password
    if user.present? && user.authenticate(params[:password])
      # Successful login: set the session cookie
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully!"
    else
      # Failed login
      flash.now[:alert] = "Invalid email or password"
      render :new, status: :unauthorized
    end
  end

  def destroy
    # Log out: reset the session
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end
end
end
