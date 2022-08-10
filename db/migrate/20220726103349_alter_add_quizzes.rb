# frozen_string_literal: true

class AlterAddQuizzes < ActiveRecord::Migration[6.1]
  def change
    add_column :quizzes, :answers, :string
  end
end
