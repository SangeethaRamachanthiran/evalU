# frozen_string_literal: true

class CreatesController < ApplicationController
  @@test_id = 0
  def quiz
    @users_ques = @current_user.id
    @side_ques = Quiz.find_by(users_id: @users_ques)
    p ']]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]'
    p @side_ques
    @save = Quiz.new
    # random_num
  end

  def test
    @questions = Quiz.where(test_id: params[:test_id])
    p '==================================='
    p @questions
    render 'quiz'
  end

  def check
    @ww = AddLibrary.where(heading: params[:heading])
    @questions = Quiz.where(test_id: params[:test_id])
    p '????????????????????????????????????????????????????'
    # redirect_to ''
  end

  def save_library
    create_quiz_id = params[:test_id]
    @questions = Quiz.where(test_id: create_quiz_id)
    @save = Quiz.new
  end

  def store
    quiz_details = Quiz.new(quiz_params)
    quiz_details.users_id = session[:current_user_id]
    quiz_details.test_id = @@test_id
    if quiz_details.save
      redirect_to '/quiz'
      # flash.now[:notice] = 'Question is added'
    else
      # flash.now[:alert] = 'Question is not added'
      render '/quiz'
    end
    # random_num
  end

  def edit_quiz
    @quiz_details = Quiz.find(params[:id])
    if @quiz_details.update(params.require(:edit_quiz).permit(:question, :optionA, :optionB, :optionC, :optionD,
                                                              :answer, :timer))
      redirect_to '/quiz'
    else
      render plain: @user_details.errors.full_messages.first
    end
  end

  def increase_test_id
    @@test_id += 1
    p '=================================================='
    redirect_to action: 'add_library', save: heads_params
  end

  def add_library
    library = AddLibrary.new(heads_params)
    library.users_id = session[:current_user_id]

    if library.save
      redirect_to '/quiz'
    else
      flash.now[:alert] = 'Your code is already exists'
      render 'save_library'
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:question, :optionA, :optionB, :optionC, :optionD, :answer, :timer)
  end

  def heads_params
    params.require(:save).permit(:heading, :description, :quesno)
  end
end
