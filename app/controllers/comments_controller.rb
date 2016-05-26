class CommentsController < ApplicationController
  before_action :current_user
  def new
    @comment = Comment.new
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.new(comment_params)
    if @comment.save
      redirect_to blogs_path
    else
      render text: 'Try again'
    end
  end

  def edit
    @blog = Blog.find(params[:blog_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render 'blogs/index'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id,:blog_id,:data)
  end
end
