class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    User.create(user_params)
    redirect_to(users_path)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to(users_path)
  end

  def destroy
    user = User.find(params[:id])
    user.delete
    redirect_to(users_path)
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, :address)
  end
end
