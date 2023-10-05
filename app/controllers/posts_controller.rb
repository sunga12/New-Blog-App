class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments, :author)

    render json: @posts
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html { render :new }
    end
  end

  def create
    # new object from params
    @post = Post.new(params.require(:post).permit(:title, :text))
    @post.author = current_user

    # respond_to block
    respond_to do |format|
      format.html do
        if @post.save # if post saves
          # success message
          flash[:success] = 'Post Saved Successfully!'
          # redirect to index
          redirect_to user_path(id: current_user)
        else
          # error message
          flash.now[:error] = 'Error: Post could not be saved'
          # render new  end
          render :new
        end
      end
    end
  end

  def show
    @user = User.find(params[:user_id])
    @user_post = @user.posts.find(params[:id])
    @comments = @user_post.comments
  end

  def destroy
    @post = Post.find(params[:post_id])
    # @user = User.find(params[:user_id])
    # @post = @user.posts.find(params[:id])
    @comments = @post.comments
    @post.likes.destroy_all
    @comments.destroy_all
    @post.destroy
    redirect_to user_posts_path(id: current_user)
  end
end
