class SessionsController < ApplicationController

  def login
    # require 'pry'; binding.pry
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
       session[:user_id] = user.id 
       flash[:success] = "Welcome to your Dashboard, #{user.name}"

       redirect_to dashboard_path(user)
    else 
      flash[:error] = "Invalid Credentials, please try again"
      redirect_to root_path
    end
  end

  def logout 
    session.delete(:user_id)
    flash[:notice] = "You have been logged out"
    redirect_to root_path
  end
end
