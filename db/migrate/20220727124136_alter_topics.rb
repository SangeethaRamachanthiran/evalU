# frozen_string_literal: true

class AlterTopics < ActiveRecord::Migration[6.1]
  def change
    remove_column :topics, :image_of_topic
    add_column :topics, :image_of_topic, :string
    add_index :topics, :image_of_topic, unique: true

    remove_column :topics, :text_of_topic
    add_column :topics, :text_of_topic, :string
    add_index :topics, :text_of_topic, unique: true
  end
end
