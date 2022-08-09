class AlterQuizzesColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :quizzes, :test_id, :bigint
  end
end
