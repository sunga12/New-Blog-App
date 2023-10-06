class Api::V1::CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    render json: @comments
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
end
