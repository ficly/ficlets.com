class FicletsApp < Sinatra::Base
  namespace '/stories' do
    get '' do
      page = params[:page] =~ /^\d+$/ ? params[:page].to_i : 1
      @stories = Story.order('orig_id ASC').page(page)

      if !@stories.empty?
        @page_title = page > 1 ? "Stories – Page #{page}" : 'Stories'

        erb :'stories/index'
      else
        404
      end
    end

    get '/:id' do
      if @story = Story.where(orig_id: params[:id]).first
        @page_title = "#{@story.title} – A story by #{@story.author.name}"

        erb :'stories/show'
      else
        404
      end
    end
  end
end