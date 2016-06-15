class BlogsController < ApplicationController
  before_action :find_blog, only: [:show, :destroy, :update, :edit]
  before_action :authenticate_user , except: [:index, :show, :about_us]
  include UserActivity

  def index
    @blogs = Blog.order(updated_at: 'desc')
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.new(blog_params)
    if @blog.save
      redirect_to @blog
    else
      render 'new'
    end
  end

  def update
    if user_authorized?
      @blog.update(blog_params)
      redirect_to @blog
    else
      activity_type = params[:controller] + '.' + params[:action]
      byebug
      create_activity(current_user.id,activity_type,@blog.id)
      redirect_to @blog
    end
  end

  def destroy
    if user_authorized?
      @blog.destroy
      redirect_to user_path(current_user)
    else
      activity_type = params[:controller] + '.' + params[:action]
      create_activity(current_user.id,activity_type,@blog.id)
      redirect_to blogs_path
    end
  end

  private
  def blog_params
    params.require(:blog).permit(:title,:category,:body)
  end

  def find_blog
    @blog = Blog.find(params[:id])
  end

  def user_authorized?
    current_user.role.include?('Admin') || @blog.blog_owner?(current_user)
  end
end
