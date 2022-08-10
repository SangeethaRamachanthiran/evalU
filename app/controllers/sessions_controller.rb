# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def login
    @user = User.new
    @input_list = User.all
  end

  def create
    user = User.find_by_email_id(params[:email_id])
    if user&.authenticate(params[:password])
      session[:current_user_id] = user.id
      # flash.now[:notice] = "Logged in successfully"
      redirect_to '/home'
    else
      flash.now[:alert] = 'Email or password is invalid'
      render 'login'
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
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to '/home'
  end
end
