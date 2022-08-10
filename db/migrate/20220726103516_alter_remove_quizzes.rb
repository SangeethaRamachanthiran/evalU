# frozen_string_literal: true

class AlterRemoveQuizzes < ActiveRecord::Migration[6.1]
  def change
    remove_column :quizzes, :answer
  end
end
