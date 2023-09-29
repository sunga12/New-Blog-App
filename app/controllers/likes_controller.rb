class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(author: current_user, post: @post)
    # @like = current_user.likes.new(post_id: @post)
    if @like.save 
      flash[:success] = "Like saved Successfully"
      redirect_to user_post_path(id: current_user)
    else
      flash.now[:error] = "Error: Like could not be saved"
    end
  end
end
