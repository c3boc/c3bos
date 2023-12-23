class SessionsController < ApplicationController

  skip_before_action :require_login, only:[:new, :create]  

  def new
  end

  def create
    if user = User.authenticate_by(username: params[:username], password: params[:password])
      login(user)
      flash[:success] = "Successfully logged in"
      redirect_to root_path
    else
      flash.now[:danger] = "Username or Password incorrect"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout current_user
    flash[:success] = "Successfully logged out"
    redirect_to root_path
  end
end
