class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user 
      flash[:success] = "Welcome to this super cool app! It's super cool."
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end


end