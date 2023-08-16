class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.name = @user.full_name
    if @user.save
      redirect_to users_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation).merge(name: full_name)
  end
end
