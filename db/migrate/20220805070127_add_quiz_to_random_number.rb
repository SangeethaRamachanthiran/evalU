# frozen_string_literal: true

class AddQuizToRandomNumber < ActiveRecord::Migration[6.1]
  def change
    add_reference :random_numbers, :quiz, null: false, foreign_key: true
  end
end
