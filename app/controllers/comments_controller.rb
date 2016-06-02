class CommentsController < ApplicationController
  before_action :current_user
  def new
    @comment = Comment.new
  end

  def create
    @blog = find_blog
    @comment = @blog.comments.new(comment_params)
    if @comment.save
      redirect_to blogs_path
    else
      render text: 'Try again'
    end
  end

  def edit
    @blog = find_blog
    @comment = find_comment
  end

  def update
    @blog = find_blog
    @comment = find_comment
    @comment.update(comment_params)
  end

  def destroy
    @blog = find_blog
    @comment = find_comment
    @comment.destroy
    redirect_to blogs_path
  end

  private
  def find_blog
    Blog.find(params[:blog_id])    
  end

  def find_comment
    Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:user_id,:blog_id,:data)
  end
end
