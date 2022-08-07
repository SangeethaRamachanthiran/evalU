class CreatesController < ApplicationController
  def quiz
    @questions = Quiz.all
    # random_num
  end
  def fillup
  end
  def true_or_false
  end
  
  def store
    quiz_details = Quiz.new(quiz_params)
    if quiz_details.save
      redirect_to '/quiz'
    else  
      render plain: "Fail"
    end
    # random_num
  
  end

  private
  def quiz_params
    params.require(:quiz).permit(:question, :optionA, :optionB, :optionC, :optionD, :answer, :timer)
  end
end
