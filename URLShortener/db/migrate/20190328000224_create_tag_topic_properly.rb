class CreateTagTopicProperly < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_topic do |t|
      t.string :topic_name, null: false
    end

    create_table :taggings do |t|
      t.integer :short_url_id, null: false
      t.integer :topic_id, null: false

      t.timestamps
    end

    add_index :taggings, :short_url_id
    add_index :taggings, :topic_id
    add_index :tag_topic, :topic_name, unique: true
  end
end
