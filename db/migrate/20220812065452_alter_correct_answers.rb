# frozen_string_literal: true

class AlterCorrectAnswers < ActiveRecord::Migration[6.1]
  def change
    add_column :correct_answers, :status, :boolean
  end
end
