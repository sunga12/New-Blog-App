class PostsController < ApplicationController
  before_action :set_posts, only: [:index]
  before_action :find_post, only: [:show]

  def index
    @posts
  end

  def show
    @post
  end

  private

  def set_posts
    @posts = Post.all
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
