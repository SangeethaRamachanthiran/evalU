class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|
      t.string :text_of_topic
      t.string :image_of_topic

      t.timestamps
    end
  end
end
