class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def current_user
    begin
      current_user = User.find(session[:user_id])
    rescue Exception
      flash[:notice] = "Please login first !!"
      render 'sessions/new'
    end
  end
end
