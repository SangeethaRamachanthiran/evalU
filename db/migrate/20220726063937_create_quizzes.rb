class CreateQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :quizzes do |t|
      t.string :question
      t.string :option1
      t.string :option2
      t.string :option3
      t.string :option4

      t.timestamps
    end
  end
end
