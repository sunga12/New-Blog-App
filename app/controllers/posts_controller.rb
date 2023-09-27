class PostsController < ApplicationController

  def initialize
  @posts = Post.all
  end

  def index
  end

  def show
    @post = Post.find(params[:id])
  end
end
