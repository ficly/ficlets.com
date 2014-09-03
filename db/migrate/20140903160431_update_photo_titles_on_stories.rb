class UpdatePhotoTitlesOnStories < ActiveRecord::Migration
  def up
    stories = Story.where('photo_url IS NOT NULL')

    stories.each do |story|
      story.photo_title = story.photo_title.gsub(/^View\s|\son Flickr$/, '')
      story.save!
    end
  end
end
