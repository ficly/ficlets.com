class Story < ActiveRecord::Base
  belongs_to :author
  has_and_belongs_to_many :tags
  has_many :comments, dependent: :destroy

  before_destroy { tags.clear }

  self.per_page = 100

  def prequels
    related_stories(prequel_ids)
  end

  def sequels
    related_stories(sequel_ids)
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