# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authorize_admin
  skip_before_action :authorize_admin, only: %i[new create]
  before_action :set_user, only: %i[set_role]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role = 0

    if @user.save
      redirect_to root_url, info: 'Signed up!'
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  def set_role
    @user.role = params[:role]
    session.delete(@user.id) if @user.disabled?
    @user.save

    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
