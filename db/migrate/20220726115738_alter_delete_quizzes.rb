class AlterDeleteQuizzes < ActiveRecord::Migration[6.1]
  def change
    remove_column :quizzes, :answers
  end
end
