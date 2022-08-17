# frozen_string_literal: true

class AlterUsersTable < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :email_id, :string, unique: true
    change_column :add_libraries, :heading, :string, unique: true
  end
end
