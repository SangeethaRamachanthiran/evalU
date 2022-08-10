# frozen_string_literal: true

class DashboardsController < ApplicationController
  def explore
    @topic_list = Topic.all
  end

  def mylibrary
    @headings = AddLibrary.all
    p @headings
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

  def report; end

  def profile; end

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
