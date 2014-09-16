class Story < ActiveRecord::Base
  belongs_to :author
  has_many :comments, dependent: :destroy
  # has_many :tags

  self.per_page = 100

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
      if story = Story.where(original_id: story_id).first
        stories << story
      end
    end

    stories
  end
end