class CommentsController < ApplicationController
  before_action :find_blog, :current_user
  before_action :find_comment, only: [:edit, :update, :destroy]
  before_action :authenticate_user
  def new
    @comment = Comment.new
  end

  def create
    @comment = @blog.comments.new(comment_params.merge(user_id: @blog.user_id))
    @comment.save
  end

  def update
    @comment.update(comment_params)
    redirect_to blog_path(@comment.blog_id)
  end

  def destroy
    @comment.destroy
    redirect_to blogs_path
  end

  private
  def find_blog
    @blog = Blog.find(params[:blog_id])    
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:user_id,:blog_id,:data)
  end
end
