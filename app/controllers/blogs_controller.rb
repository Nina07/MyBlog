class BlogsController < ApplicationController
  before_action :find_blog, only: [:show, :destroy, :update, :edit]
  before_action :authenticate_user
  layout 'blog'
  def index
    @blogs = Blog.all
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
    if @blog.update(blog_params)
      redirect_to @blog
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    redirect_to user_path(current_user.id)
  end

  private
  def blog_params
    params.require(:blog).permit(:title,:category,:body)
  end

  def find_blog
    @blog = Blog.find(params[:id])
  end
end
