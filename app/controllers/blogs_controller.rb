class BlogsController < ApplicationController
  before_action :current_user
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    byebug
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to @blog
    else
      render 'new'
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def blog_params
    params.require(:blog).permit(:title,:category,:body)
  end
end
