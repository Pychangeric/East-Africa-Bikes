class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in @user
      redirect_to root_path, notice: 'User was successfully created and signed in.'
    else
      render :new
    end
  end

  def logout
    sign_out current_user
    redirect_to root_path, notice: 'You have been logged out.'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
