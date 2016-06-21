class BlogsController < ApplicationController
  before_action :find_blog, only: [:show, :destroy, :update, :edit]
  before_action :authenticate_user!, except: [:index, :show, :about_us]
  # before_action :authenticate_user , except: [:index, :show, :about_us]
  before_action :authorize!, only: [:update, :destroy]
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
    @blog.assign_attributes(blog_params)
    if current_user.is_moderator?
      @blog.create_update_activity(current_user)
    elsif user_authorized? #check twice
      @blog.update(blog_params)
    end
    redirect_to @blog
  end

  def destroy
    if user_authorized?
      @blog.destroy(blog_params)
      redirect_to blogs_path
    else
      @blog.create_update_activity(current_user,@blog.changes)
      redirect_to @blog
    end
  end

  private
  def blog_params
    params.require(:blog).permit(:title,:category,:body)
  end

  def find_blog
    @blog = Blog.find(params[:id])
  end

  def user_authorized? #checks that he should'nt be a normal user or blog owner
    current_user.blog_owner?(current_user) || current_user.is_admin?
  end

  def authorize!#checks current_user, if normal wouldn't let further processing happen.
    unless user_authorized?
      flash[:alert] = 'Aunauthorized'
      redirect_to :back
     end
  end
end
