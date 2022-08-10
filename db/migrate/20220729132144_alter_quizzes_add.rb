# frozen_string_literal: true

class AlterQuizzesAdd < ActiveRecord::Migration[6.1]
  def change
    add_column :quizzes, :timer, :integer
  end
end
