# app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
  # You must include both methods here so they are available in ALL controllers (like HomeController) and views
  helper_method :current_user, :user_signed_in? 

  def current_user
    # Find the user based on the session ID, or return nil
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    # This method relies on current_user and must be defined
    current_user.present? 
  end

  # ... rest of your methods ...
end
