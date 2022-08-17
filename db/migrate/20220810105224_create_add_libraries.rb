# frozen_string_literal: true

class CreateAddLibraries < ActiveRecord::Migration[6.1]
  def change
    create_table :add_libraries do |t|
      t.string :heading
      t.string :description
      t.integer :quesno

      t.timestamps
    end
  end
end
