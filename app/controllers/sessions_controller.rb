class SessionsController < ApplicationController

  skip_before_action :require_login, only:[:new, :create]  

  def new
  end

  def create
    if user = User.authenticate_by(username: params[:username], password: params[:password])
      login(user)
      redirect_to root_path, notice: "Successfully logged in"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout current_user
    redirect_to root_path, notice: "Successfully logged out"
  end
end