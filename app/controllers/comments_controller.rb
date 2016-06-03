class CommentsController < ApplicationController
  before_action :find_blog
  before_action :find_comment, only: [:update, :destroy]
  def new
    @comment = Comment.new
  end

  def create
    @comment = @blog.comments.new(comment_params)
    if @comment.save
      redirect_to @blog
    else
      render text: 'Try again'
    end
  end

  # def edit
  #   respond_to do |format|
  #     format.js
  #   end
  #   # @blog = find_blog
  #   # @comment = find_comment
  # end

  def update
    @comment.update(comment_params)
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
