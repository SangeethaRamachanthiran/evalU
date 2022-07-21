class UsersController < ApplicationController
  def register
    @user = User.new
  end
  def create
    user_details = User.new(users_params)
    if user_details.save
      flash.now[:alert] = "Successfully registered"
      redirect_to '/home'
    else 
      flash.now[:alert] = "Not registered"
      render "/register"
    end
  end

  private
  def users_params
    params.require(:user).permit(:username, :email_id, :password, :dob)
  end
end
