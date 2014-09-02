class AssociateStoriesWithAuthors < ActiveRecord::Migration
  def up
    add_column :stories, :author_id, :integer

    Story.all.each do |story|
      author = Author.where(uri_name: story.author_short).first

      if !author
        author = Author.new({ name: story.author, uri_name: story.author_short })

        author.save!
      end

      story.author_id = author.id
      story.save!
    end

    # TODO:
    # A migration that removes the two columns below

    # remove_column :stories, :author
    # remove_column :stories, :author_short
  end

  def down
    # add_column :stories, :author, :string
    # add_column :stories, :author_short, :string
    remove_column :stories, :author_id
  end
end
