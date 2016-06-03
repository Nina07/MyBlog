class SessionsController < ApplicationController
  layout 'sessions'
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash[:alert] = "Invalid user/password combination"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
