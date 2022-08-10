# frozen_string_literal: true

class CreateChooses < ActiveRecord::Migration[6.1]
  def change
    create_table :chooses do |t|
      t.string :code

      t.timestamps
    end
  end
end
