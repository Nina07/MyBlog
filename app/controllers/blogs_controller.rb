class BlogsController < ApplicationController
  before_action :current_user
  layout 'blog'
  def index
    byebug
    @blogs = Blog.all
    @comment = Comment.new
    @current_user = current_user
  end

  def new
    @blog = Blog.new
    @comment = @blog.comments.new
    @current_user = current_user
  end

  def create
    byebug
    @blog = current_user.blogs.new(blog_params)
    if @blog.save
      redirect_to @blog
    else
      render 'new'
      # redirect_to new_blog_path
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to @blog
    else
      render 'edit'
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    if @blog.destroy
      redirect_to user_path(current_user.id)
    end
  end

  private
  def blog_params
    params.require(:blog).permit(:title,:category,:body)
  end
end
