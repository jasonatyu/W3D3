class CreateTagTopic < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_topics do |t|
      t.integer :short_url_id, null: false
      t.string :topic, null: false

      t.timestamps
    end

    add_index :tag_topics, :short_url_id
  end
end
