class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def show
    @user = User.find(params[:user_id])
    @user_post = @user.posts.find(params[:id])
    @comments = @user_post.comments
  end
end
