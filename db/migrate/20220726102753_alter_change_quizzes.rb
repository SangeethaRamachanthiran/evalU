# frozen_string_literal: true

class AlterChangeQuizzes < ActiveRecord::Migration[6.1]
  def change
    remove_column :quizzes, :answer
    add_column :quizzes, :answer, :string
  end
end
