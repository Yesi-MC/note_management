class SessionsController < ApplicationController 
  def login
    # require 'pry'; binding.pry
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
       session[:user_id] = user.id 
       flash[:success] = "Welcome"

       redirect_to dashboard_path(user)
    else 
      flash[:error] = "Invalid Credentials, please try again"
      render :new
    end
  end
end
