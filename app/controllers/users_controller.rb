class UsersController < ApplicationController
  def register
    @user = User.new
  end
  def create
    user = User.new(users_params)
    if user.save
      redirect_to '/home'
    else 
      flash.now[:alert] = "Not registered"
      render 'register'
    end
  end

  private
  def users_params
    params.require(:user).permit(:username, :email_id, :password_digest, :dob)
  end
end
