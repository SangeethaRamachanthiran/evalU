# frozen_string_literal: true

class AddUsersToAddLibraries < ActiveRecord::Migration[6.1]
  def change
    add_reference :add_libraries, :users, null: false, foreign_key: true
  end
end
