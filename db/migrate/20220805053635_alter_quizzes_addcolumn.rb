# frozen_string_literal: true

class AlterQuizzesAddcolumn < ActiveRecord::Migration[6.1]
  def change
    add_column :quizzes, :random_num, :string
  end
end
