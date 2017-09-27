class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
   @user = User.find(params[:id])
   @users = User.all
  end

  def edit
    @user = User.find(current_user.id)
end
