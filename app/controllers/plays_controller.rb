# frozen_string_literal: true

class PlaysController < ApplicationController
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
    show_quiz_id = params[:test_id]
    @cur_quiz = Quiz.where(test_id: show_quiz_id)
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
    # show_quiz_id = params[:test_id]
    # @cur_quiz = Quiz.where(test_id: show_quiz_id)
    @answered = CorrectAnswer.new(params.require(:ans).permit(:cor_answer))
    quiz_details.users_id = session[:current_user_id]
    render action: 'showquestion' if @answered.save
  end

  def get
    @search = Choose.new(params.require(:search).permit(:text_field))
    @choose = AddLibrary.find_by_heading(params[:search][:text_field])
    @test_quiz = Quiz.select(:test_id)
    # p "////////////////////////////////"
    # p
    # p @test_quiz
    if @choose.heading == @search.text_field
      redirect_to "/show_quiz/#{@test_quiz}"
      # render plain: 'true'
    else
      render plain: false
    end
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
end
