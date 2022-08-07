class AlterAddColumnQuizzes < ActiveRecord::Migration[6.1]
  def change
    add_column :quizzes, :random_num, :integer
    add_index :quizzes, :random_num, unique: true
  end
end
