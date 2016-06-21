class CommentsController < ApplicationController
  before_action :find_blog, :current_user
  before_action :find_comment, only: [:edit, :update, :destroy]
  before_action :authenticate_user

  def new
    @comment = Comment.new
  end

  def create
    @comment = @blog.comments.new(comment_params.merge(user_id: current_user.id))
    @comment.save
  end

  def update
    @comment.assign_attributes(comment_params)
    if user_authorized?
      @comment.update(comment_params)
    else
      @comment.create_update_activity(current_user,@comment.changes)
    end
    redirect_to blog_path(@comment.blog_id)
  end

  def destroy
    if user_authorized?
      @comment.destroy
    else
      @comment.create_destroy_activity(current_user)
    end
    redirect_to blog_path(@comment.blog_id)
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id,:blog_id,:data)
  end

  def find_blog
    @blog = Blog.find(params[:blog_id])    
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def user_authorized? #checks that he should'nt be a normal user or blog owner
    current_user.comment_owner?(current_user) || current_user.is_admin?
  end

  def authorize!
    unless user_authorized?
      flash[:alert] = 'Aunauthorized'
      redirect_to :back
     end
  end
end
