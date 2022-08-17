# frozen_string_literal: true

class CreateQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :quizzes do |t|
      t.string :question
      t.string :optionA
      t.string :optionB
      t.string :optionC
      t.string :optionD
      t.string :answer
      t.string :timer
      t.bigint :test_id

      t.timestamps
    end
  end
end
