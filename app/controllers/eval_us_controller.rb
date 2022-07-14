class EvalUsController < ApplicationController
  def index
    @input_list = User.all
  end

  # def user_list
  #   User.order(:id).map{|users| users.to_pleasent_string}
  # end
end
