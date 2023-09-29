class CommentsController < ApplicationController
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html { render :new }
    end
  end

  def create
  end
end
