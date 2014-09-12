class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.integer  :original_id
      t.integer  :story_id
      t.integer  :author_id
      t.text     :body
      t.datetime :published_at
      t.timestamps
    end
  end

  def down
    drop_table :comments
  end
end
