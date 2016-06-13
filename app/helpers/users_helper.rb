module UsersHelper
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
end
