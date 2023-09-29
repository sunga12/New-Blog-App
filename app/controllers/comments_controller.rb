class CommentsController < ApplicationController
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

    respond_to do |format|
      format.html do
        if @comment.save
          flash[:success] = "Comment saved Successfully"
          redirect_to user_posts_path(id: current_user)
        else
          flash.now[:error] = "Error: Comment could not be saved"
          render :new
        end
      end
    end

  end
end
