# app/controllers/home_controller.rb (Corrected)
class HomeController < ApplicationController
  def index
    # Use the boolean method to check the status
    if user_signed_in? 
      # If TRUE, the user is logged in, redirect them to their internal home page
      redirect_to current_user
    else
      # If FALSE, the user is not logged in, redirect them to the sign-up page
      redirect_to signup_path    
    end
  end
end
