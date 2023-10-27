# app/controllers/admin/users_controller.rb

class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  # GET /admin/users
  def index
    @users = User.all
  end

  # GET /admin/users/1
  def show
    @user = User.find(params[:id])
  end

  # GET /admin/users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # PATCH/PUT /admin/users/1
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_users_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/users/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: 'User was successfully destroyed.'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :role_ids => [])
  end
end
