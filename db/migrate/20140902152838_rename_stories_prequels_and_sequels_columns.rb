class RenameStoriesPrequelsAndSequelsColumns < ActiveRecord::Migration
  def up
    rename_column :stories, :prequels, :prequel_ids
    rename_column :stories, :sequels, :sequel_ids
  end

  def down
    rename_column :stories, :prequel_ids, :prequels
    rename_column :stories, :sequel_ids, :sequels
  end
end
