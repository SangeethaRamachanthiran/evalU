# frozen_string_literal: true

class DashboardsController < ApplicationController
  before_action :ensure_user_logged_in
  def explore
    # @topic_list = Topic.all
  end

  def mylibrary
    @code_check = AddLibrary.find_by(users_id: @current_user.id)
    @headings = AddLibrary.where(users_id: current_user.id)
    @quest = Quiz.all
    @questions = Quiz.select(:test_id)
    p '777777777777777777777777777777777777777777777777777'
    p @headings
    # p @headings
  end

  def edit_code
    @head = AddLibrary.where(users_id: current_user.id)
  end

  def update_code
    @code_details = AddLibrary.find(params[:id])
    if @code_details.update(params.require(:edit_details).permit(:heading, :description))
      redirect_to '/mylibrary'
    else
      render plain: @user_details.errors.full_messages.first
    end
  end

  def lib
    @heads = params[:heading]
    render plain: true
  end

  def listQuestion
    @library = AddLibrary.all
    @question_id = Quiz.all
    p '@@@@@@@@@@@@@@@@@@@@'
    p @library.ids
    p '------------------------------------'
    # p @question_id.test_id
    # if (@library.id == @question_id.test_id)
  end

  def report
    @current_user_id = session[:current_user_id]
    @current_user = User.find(@current_user_id)
    @user_check = CorrectAnswer.find_by(users_id: @current_user.id)
    @user_report = CorrectAnswer.where(users_id: @current_user_id)

    p '00000000000000000000000000000'
    p @user_report
  end

  def profile
    @current_user_id = session[:current_user_id]
    @current_user = User.find(@current_user_id)
    p '444444444444444444444444444444444'
    p @current_user_id
    p @current_user
  end

  def edit
    @edit_details = User.find(params[:id])
    render :edit
  end

  def update
    @user_details = User.find(params[:id])
    if @user_details.update(params.require(:edit_details).permit(:username, :dob))
      redirect_to '/profile'
    else
      render plain: @user_details.errors.full_messages.first
    end
  end

  def add_topic; end

  def added
    topics = Topic.new(add_params)
    if topics.save
      redirect_to '/explore'
    else
      render 'add'
    end
  end

  private

  def add_params
    params.require(:topic).permit(:text_of_topic, :image_of_topic)
  end
end
