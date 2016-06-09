module UsersHelper
  def current_user
    if session[:user_id]
      @user ||= User.find(session[:user_id])
    end
  end

  def authenticate_user
    unless session[:user_id]
      flash[:notice] = "Please login first !!"
      respond_to do |format|
        format.html { redirect_to login_path }
        format.js do 
          render js: "window.location = '#{login_url}'"
        end
      end
    end
  end

  def blog_owner?
    session[:user_id] == @blog.user_id
  end
end
