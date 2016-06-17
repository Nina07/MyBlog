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
    if user_authorized?
      @comment.update(comment_params)
    else
      @comment.create_update_activity(current_user)
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

  def user_authorized?
    current_user.user_role.role == 0 || @comment.comment_owner?(current_user)
  end
end
