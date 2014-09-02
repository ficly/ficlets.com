class RemoveAuthorColumnsFromStories < ActiveRecord::Migration
  def up
    remove_column :stories, :author
    remove_column :stories, :author_short
  end

  def down
    add_column :stories, :author, :string
    add_column :stories, :author_short, :string
  end
end
