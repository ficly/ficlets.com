class FicletsApp < Sinatra::Base
  namespace '/stories' do
    get '' do
      @stories = Story.order('orig_id ASC')

      erb :'stories/index'
    end

    get '/:id' do
      if @story = Story.where(orig_id: params[:id]).first
        @tags = @story.cached_tags.split(', ')
        @prequels = @story.related_stories(@story.prequels)
        @sequels = @story.related_stories(@story.sequels)

        erb :'stories/show'
      else
        404
      end
    end
  end
end