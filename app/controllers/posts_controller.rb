class PostsController < ApplicationController

  def initialize
  @posts = Post.all
  end

  def index
  end

  def show; end
end
