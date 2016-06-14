class BlogsController < ApplicationController
  before_action :find_blog, only: [:show, :destroy, :update, :edit]
  before_action :authenticate_user , except: [:index, :show, :about_us]
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
    if (@blog.blog_owner?(current_user) || current_user.role == "Admin")
      @blog.update(blog_params)
      redirect_to @blog
    else
    end
  end

  def destroy
    @blog.destroy
    redirect_to user_path(current_user)
  end

  private
  def blog_params
    params.require(:blog).permit(:title,:category,:body)
  end

  def find_blog
    @blog = Blog.find(params[:id])
  end
end
