# frozen_string_literal: true

class AlterUsersChange < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :dob, :date
  end
end
