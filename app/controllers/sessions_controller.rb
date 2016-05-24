class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    @user.destroy
    redirect_to login_path
  end
end
