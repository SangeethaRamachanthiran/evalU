# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_220_811_110_315) do
  create_table 'add_libraries', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'heading'
    t.string 'description'
    t.integer 'quesno'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'users_id', null: false
    t.index ['users_id'], name: 'index_add_libraries_on_users_id'
  end

  create_table 'chooses', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'text_field'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'correct_answers', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'cor_answer'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'users_id', null: false
    t.index ['users_id'], name: 'index_correct_answers_on_users_id'
  end

  create_table 'quizzes', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'question'
    t.string 'optionA'
    t.string 'optionB'
    t.string 'optionC'
    t.string 'optionD'
    t.string 'answer'
    t.string 'timer'
    t.bigint 'test_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'users_id', null: false
    t.index ['users_id'], name: 'index_quizzes_on_users_id'
  end

  create_table 'users', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'password_digest'
    t.date 'dob'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'email_id'
    t.string 'username'
    t.index ['email_id'], name: 'index_users_on_email_id', unique: true
    t.index ['username'], name: 'index_users_on_username', unique: true
  end

  add_foreign_key 'add_libraries', 'users', column: 'users_id'
  add_foreign_key 'correct_answers', 'users', column: 'users_id'
  add_foreign_key 'quizzes', 'users', column: 'users_id'
end
