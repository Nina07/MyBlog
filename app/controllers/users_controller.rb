class UsersController < ApplicationController
  before_action :find_user, except: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = find_user
  end

  def show
    @user = find_user
    @blogs = @user.blogs 
  end

  def update
    @user = find_user
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = find_user
    @user.destroy
    redirect_to root_path
  end

  private
  def find_user
    User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:f_name,:l_name,:password,:password_confirmation,:address,:email,:phone,:about_user)
  end
end
