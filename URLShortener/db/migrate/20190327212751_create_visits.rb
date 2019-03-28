class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.integer :short_url_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end

    create_table :shortened_urls do |t|
      t.string :long_url, null: false
      t.string :short_url
      t.integer :user_id, null: false
      t.timestamps
    end

    add_index :visits, :short_url_id
    add_index :visits, :user_id
  end
end
