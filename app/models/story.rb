class Story < ActiveRecord::Base
  belongs_to :author

  def related_stories(data = [])
    stories = []
    story_ids = YAML.load(data)

    story_ids.each do |id|
      stories << Story.where(orig_id: id).first
    end

    stories
  end
end