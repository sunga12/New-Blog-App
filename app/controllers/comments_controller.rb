class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end

  def new
    @comment = Comment.new

    respond_to do |format|
      format.html { render :new }
    end
  end

  def create
    @comment = Comment.new(params.require(:comment).permit(:text))
    @comment.post = Post.find(params[:post_id])
    @comment.author = current_user

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: { comment: @comment.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
    redirect_to user_posts_path(id: current_user)
  end
end
