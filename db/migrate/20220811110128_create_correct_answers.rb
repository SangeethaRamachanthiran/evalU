# frozen_string_literal: true

class CreateCorrectAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :correct_answers do |t|
      t.string :cor_answer

      t.timestamps
    end
  end
end
