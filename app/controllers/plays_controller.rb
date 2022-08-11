# frozen_string_literal: true

class PlaysController < ApplicationController
  def choose; end

  def showquestion
    @questions = Quiz.all
    @head = AddLibrary.all
  end

  def testing
    @questions = Quiz.all
    quest = Quiz.select(:test_id)
    # @fin = AddLibrary.all
    # @val = @questions

    # p "9999999999999999999999999999"
    # p id_lib
    vall = AddLibrary.all.ids
    if quest = vall
      @head = AddLibrary.select { |u| u.id == quest }
      id_lib = AddLibrary.select(:heading)
      redirect_to("/takingtest/'#{id_lib}'")
      # render plain: 'true'
    else
      render plain: 'false'
    end
  end

  def takingtest
    @questions = Quiz.all
  end

  def get
    @search = Choose.new
    @choose = AddLibrary.find_by_heading(params[:text_field])
    if @choose
      redirect_to action: 'testing'
      # render plain: 'true'
    else
      render '/play'
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
