# frozen_string_literal: true

class CreatesController < ApplicationController
  @@test_id = 1
  def quiz
    # @questions = Quiz.all
    @save = Quiz.new
    # random_num
  end

  def test
    @questions = Quiz.where(test_id: params[:test_id])
    p '==================================='
    p @questions
    render 'quiz'
  end

  def save_library
    @questions = Quiz.all
    @save = Quiz.new
  end
  # def fillup
  # end
  # def true_or_false
  # end

  def store
    quiz_details = Quiz.new(quiz_params)
    quiz_details.users_id = session[:current_user_id]
    quiz_details.test_id = @@test_id
    if quiz_details.save
      redirect_to '/quiz'
    else
      render plain: 'Fail'
    end
    # random_num
  end

  def increase_test_id
    @@test_id += 1
    redirect_to action: 'add_library', save: heads_params
  end

  def add_library
    library = AddLibrary.new(heads_params)
    library.users_id = session[:current_user_id]
    p '================!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
    p library
    if library.save
      redirect_to '/mylibrary'
    else
      # render "/quiz"
      render plain: 'fail'
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
