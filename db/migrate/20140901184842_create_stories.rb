class CreateStories < ActiveRecord::Migration
  def up
    create_table :stories do |t|
      t.integer  :orig_id
      t.string   :title
      t.text     :body
      t.string   :author
      t.string   :author_short
      t.datetime :published_at
      t.text     :cached_tags
      t.boolean  :is_mature
      t.text     :prequels
      t.text     :sequels
      t.string   :photo_url
      t.string   :photo_link
      t.string   :photo_author
      t.string   :photo_title
      t.timestamps
    end
  end

  def down
    drop_table :stories
  end
end
