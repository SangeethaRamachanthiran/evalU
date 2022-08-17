# frozen_string_literal: true

class AddUsersToCorrectAnswers < ActiveRecord::Migration[6.1]
  def change
    add_reference :correct_answers, :users, null: false, foreign_key: true
  end
end
