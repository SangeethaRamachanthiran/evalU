class PlaysController < ApplicationController
  def choose
    # @test = Quiz.find_by(:test_id params[:test_id])
    @test = Quiz.select(:test_id)
    @code = AddLibrary.select(:heading)
    @fig = params[:code]
      p "----------------++++++++++++++++"
     p @test
     p "================================="
     p @fig
  end
  def get
    

    # if user && user.authenticate(params[:password])
    #   session[:current_user_id] = user.id
    #   # flash.now[:notice] = "Logged in successfully"
    #   redirect_to '/home'
    # else
    #   flash.now[:alert] = "Email or password is invalid"
    #   render "login"
    # end
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
