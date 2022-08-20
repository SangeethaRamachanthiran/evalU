# frozen_string_literal: true

class PlaysController < ApplicationController
  @@ar = []
  def choose
    show_quiz_id = params[:test_id]
    @cur_quiz = Quiz.where(test_id: show_quiz_id)
    @headings = AddLibrary.all
    @quest = Quiz.all
    @questions = Quiz.select(:test_id)
    p '777777777777777777777777777777777777777777777777777'
    p @questions
  end

  def showquestion
    @@ar.push(params[:text_field]) unless params[:text_field].nil?
    @@emp = AddLibrary.where(heading: @@ar)
    @cur_quiz = Quiz.where(test_id: @@emp.ids)
    p 'ppppppppppppppppppppppppppppppppppppp'
    p @@emp
  end

  def showquiz
    @show_quiz = Quiz.where(test_id: params[:test_id])
    @test_id_params = Quiz.find_by_test_id(params[:id])
    p '================================================='
    p @show_quiz
    p @test_id_params
  end

  def test_code_id
    @show_quiz = Quiz.find_by(test_id: params[:test_id])
    p ']]]]]]]]]]]]]]]]]]]]]]]]]]]]]]'
    p params[:id]
    if @show_quiz
      redirect_to action: 'showquiz'
    else
      redirect_to '/mylibrary'
    end
  end

  def testing
    @questions = Quiz.all
    quest = Quiz.select(:test_id)
    vall = AddLibrary.all.ids
    if quest = vall
      @head = AddLibrary.select { |u| u.id == quest }
      @id_lib = AddLibrary.all
      redirect_to action: 'showquestion'
      # render plain: 'true'
    else
      render plain: 'false'
    end
  end

  def takingtest
    @quiz = Quiz.find(params[:id])
    p '-----------------------------------'
    @id = params[:id]
    @answer = @quiz['answer']
    @cor_answer = params[:cor_answer]

    case @answer
    when 'a'
      @exact_answer = @quiz['optionA']
    when 'b'
      @exact_answer = @quiz['optionB']
    when 'c'
      @exact_answer = @quiz['optionC']
    when 'd'
      @exact_answer = @quiz['optionD']
    end
    @result = if @cor_answer.eql?(@exact_answer)
                CorrectAnswer.create!(
                  cor_answer: @cor_answer,
                  users_id: current_user.id,
                  status: true
                )
              else
                CorrectAnswer.create!(
                  cor_answer: @cor_answer,
                  users_id: current_user.id,
                  status: false
                )
              end
    if @result.save
      @cur_quiz = Quiz.where('id > ? ', @id.to_i)
      @cur_quiz.all.each do |t|
        @record = t
      end
      if @record
        render 'showquestion'
      else
        redirect_to '/result'
      end
    else
      render plain: 'Failure'
    end
  end

  def result
    @number = 1
    @get_result = CorrectAnswer.all
    @get_status_true = @get_result.where('status LIKE ?', 1)
    @get_status_false = @get_result.where('status LIKE ?', 0)
    @get_user_status = User.find_by(id: @get_result.ids)
  end

  def topics
    @topic_list = Topic.all
  end

  def add_topic; end

  def added
    topics = Topic.new(add_params)
    if topics.save
      redirect_to '/topics'
    else
      render 'add'
    end
  end

  private

  def add_params
    params.require(:topic).permit(:text_of_topic, :image_of_topic)
  end
  #  def answer_params
  #     params.require(:ans).permit(:cor_answer)
  #  end
end
