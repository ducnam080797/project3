class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "sign_up_success"
      redirect_to root_path
    else
      flash.now[:danger] = t "sign_up_fail"
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user)
        .permit User::SIGNUP_PARAMS
  end
end
