class SessionsController < ApplicationController
  def login
    @user = User.new
    @input_list = User.all
  end

  def create

  user = User.find_by_email_id(params[:email_id])
  if user && user.authenticate(params[:password])
     session[:user_id] = user.id
     flash.now[:notice] = "Logged in successfully"
     redirect_to '/home'
   else
     flash.now[:alert] = "Email or password is invalid"
     render "login"
   end

    # @user_details = User.find_by(email_id: params[:email_id])
    # session[:user_id] = user.id
    # if @input_list != @user_details 
    # flash.now[:notice] = "Logged in successfully"
    # redirect_to '/home'
    # else
    #   flash.now[:alert] = "Invalid email/password combination"
    #   render 'login'
    # end
  end

  def destroy
    session[:user_id] = nil
    @user_logout = User.find(params[:id])
    @user_logout.destroy
    redirect_to '/home'
  end
end
