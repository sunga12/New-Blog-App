class UsersController < ApplicationController

  def initialize
  @users = User.all
  end
  
  def index; end

  def show
    @user = User.find(params[:id])
  end
end
