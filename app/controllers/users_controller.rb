class UsersController < ApplicationController
  before_action :find_user, except: [:new, :create]
  before_action :authenticate_user #, except: [:new, :create]
  skip_before_action :authenticate_user , only: [:new,:create]
  layout 'user'

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

  def show
    @blogs = @user.blogs 
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private
  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:f_name,:l_name,:password,:password_confirmation,:address,:email,:phone,:about_user)
  end
end
