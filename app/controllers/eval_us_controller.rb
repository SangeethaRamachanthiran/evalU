class EvalUsController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def index
    @presence = 0
    if current_user
      @presence = 1
      @user = User.find(current_user.id)
      render "eval_us/index"
    else
      @presence = 0
      render "eval_us/index"
    end
    @input_list = User.all
  end
end
