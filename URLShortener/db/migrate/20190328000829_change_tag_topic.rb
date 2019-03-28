class ChangeTagTopic < ActiveRecord::Migration[5.2]
  def change
    rename_table :tag_topic, :tag_topics
  end
end
