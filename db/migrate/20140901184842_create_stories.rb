class CreateStories < ActiveRecord::Migration
  def up
    create_table :stories do |t|
      t.integer  :original_id
      t.integer  :author_id
      t.string   :title
      t.text     :body
      t.boolean  :is_mature
      t.text     :prequel_ids
      t.text     :sequel_ids
      t.text     :cached_tags
      t.string   :photo_url
      t.string   :photo_link
      t.string   :photo_author
      t.string   :photo_title
      t.datetime :published_at
      t.timestamps
    end
  end

  def down
    drop_table :stories
  end
end
