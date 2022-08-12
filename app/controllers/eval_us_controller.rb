# frozen_string_literal: true

class EvalUsController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def index
    @presence = 0
    if current_user
      @presence = 1
      @user = User.find(current_user.id)
    else
      @presence = 0
    end
    render 'eval_us/index'
    @input_list = User.all
  end

  def landingpage; end
end
