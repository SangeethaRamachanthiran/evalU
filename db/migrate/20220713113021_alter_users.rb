# frozen_string_literal: true

class AlterUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :email_id
    add_column :users, :email_id, :string
    add_index :users, :email_id, unique: true

    remove_column :users, :username
    add_column :users, :username, :string
    add_index :users, :username, unique: true
  end
end
