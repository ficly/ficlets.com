class FicletsApp < Sinatra::Base
  namespace '/stories' do
    get '' do
      page = params[:page] =~ /^\d+$/ ? params[:page] : 1
      @stories = Story.order('orig_id ASC').page(page)

      if !@stories.empty?
        erb :'stories/index'
      else
        404
      end
    end

    get '/:id' do
      if @story = Story.where(orig_id: params[:id]).first
        erb :'stories/show'
      else
        404
      end
    end
  end
end