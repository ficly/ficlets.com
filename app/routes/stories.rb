class FicletsApp < Sinatra::Base
  namespace '/stories' do
    get '' do
      @stories = Story.order('orig_id ASC')

      erb :'stories/index'
    end

    get '/:id' do
      if @story = Story.where(orig_id: params[:id]).first
        @author = Author.where(uri_name: @story.author_short).first
        @tags = @story.cached_tags.split(', ')
        @prequels = []
        @sequels = []

        prequels = YAML.load(@story.prequels)
        sequels = YAML.load(@story.sequels)

        prequels.each do |prequel|
          @prequels << Story.find(prequel)
        end

        sequels.each do |sequel|
          @sequels << Story.find(sequel)
        end

        erb :'stories/show'
      else
        404
      end
    end
  end
end