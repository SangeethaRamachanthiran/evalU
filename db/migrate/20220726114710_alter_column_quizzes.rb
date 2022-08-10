# frozen_string_literal: true

class AlterColumnQuizzes < ActiveRecord::Migration[6.1]
  def change
    add_column :quizzes, :answer, :string
  end
end
