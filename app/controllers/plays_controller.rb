# frozen_string_literal: true

class PlaysController < ApplicationController
  def choose; end

  def get
    @search = Choose.new
    @choose = Choose.new(params.permit(:code))

    # # @choose = params.require(:search).permit(:code)
    # @ques = Quiz.where(test_id: params[:test_id])
    @code = AddLibrary.select(:heading)
    if @choose.save || @choose.code == @code
      redirect_to
      render plain: true
    else
      render plain: false
    end
    # @fig = params[:code]
    #  p "----------------++++++++++++++++"
    p @code
    #  p "================================="
    #  p @fig
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
