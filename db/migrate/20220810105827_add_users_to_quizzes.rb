# frozen_string_literal: true

class AddUsersToQuizzes < ActiveRecord::Migration[6.1]
  def change
    add_reference :quizzes, :users, null: false, foreign_key: true
  end
end
