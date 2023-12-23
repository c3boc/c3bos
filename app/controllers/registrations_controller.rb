class RegistrationsController < ApplicationController

  skip_before_action :require_login, only:[:new, :create]  

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      login @user
      flash[:success] = "Successfully created account"
      redirect_to root_path
    else
      flash.now[:danger] = "Error creating account"
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
