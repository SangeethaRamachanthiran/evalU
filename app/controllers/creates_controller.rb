class CreatesController < ApplicationController
  def quiz
    @questions = Quiz.all
  end
  def fill_up
  end
  def true_or_false
  end
  
  def store
    ques_details = Quiz.new(quiz_params)
    if ques_details.save
      redirect_to '/quiz'
    else  
      render plain: "Fail"
    end
  end

  private
  def quiz_params
    params.require(:quiz).permit(:question, :option1, :option2, :option3, :option4, :answer)
  end
end
