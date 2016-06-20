class BlogsController < ApplicationController
  before_action :find_blog, only: [:show, :destroy, :update, :edit]
  before_action :authenticate_user , except: [:index, :show, :about_us]
  # include UserActivity

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
    if user_authorized?
      @blog.update(blog_params)
    else
      @blog.create_update_activity(current_user,@blog.changes)
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
    if current_user.user_role.role == 2
      true if current_user.blog_owner?(current_user)
    elsif current_user.user_role.role == 1
      false
    else
      true
    end
  end
end
