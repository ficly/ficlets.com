class AddMissingPublishedAtTimestampsToStories < ActiveRecord::Migration
  def up
    stories = Story.where('published_at IS NULL')

    stories.each do |story|
      story.published_at = story.created_at
      story.save!
    end
  end
end
