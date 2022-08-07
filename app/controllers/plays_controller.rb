class PlaysController < ApplicationController
  def choose
  end
  def topics
    @topic_list = Topic.all
  end
  def add_topic
  end
  def added
    topics = Topic.new(add_params)
    if topics.save
      redirect_to "/topics"
    else 
      render "add"
    end
  end

  private
  def add_params
    params.require(:topic).permit(:text_of_topic, :image_of_topic)
  end
end
