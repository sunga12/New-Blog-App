class UsersController < ApplicationController
  before_action :set_users, only: [:index]
  before_action :find_user, only: [:show]

  def index
    @users
  end

  def show
    @user
  end

  private

  def set_users
    @users = User.all
  end

  def find_user
    @user = User.find(params[:id])
  end
end
