class Story < ActiveRecord::Base
  belongs_to :author

  def prequels
    related_stories(prequel_ids)
  end

  def sequels
    related_stories(sequel_ids)
  end

  def tags
    cached_tags.split(', ')
  end

  private

  def related_stories(data = [])
    stories = []
    story_ids = YAML.load(data)

    story_ids.each do |story_id|
      stories << Story.where(orig_id: story_id).first
    end

    stories
  end
end