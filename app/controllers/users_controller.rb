class UsersController < ApplicationController
  before_action :find_user, except: [ :index, :new, :create , :change_role]
  before_action :user_signed_in?, except: [:new, :create]
  def index
    @regular_users = User.where(user_role_id: 3)
    @moderators = User.where(user_role_id: 2)
  end

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
    params.require(:user).permit(:f_name,:l_name,:password,:password_confirmation,:address,:email, :phone, :about_user, :user_role_id)
  end
end
