class CreateStoriesTags < ActiveRecord::Migration
  def up
    create_table :stories_tags, id: false do |t|
      t.belongs_to :story
      t.belongs_to :tag
    end
  end

  def down
    drop_table :stories_tags
  end
end
