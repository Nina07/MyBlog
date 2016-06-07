module UsersHelper
  def current_user
    if session[:user_id]
      @user ||= User.find(session[:user_id])
    end
  end

  def authenticate_user
    byebug
    unless session[:user_id]
      flash[:notice] = "Please login first !!"
      redirect_to login_path
    end
  end
end
