# frozen_string_literal: true

class AlterQuizzesDelete < ActiveRecord::Migration[6.1]
  def change
    remove_column :quizzes, :random_num
  end
end
