class FicletsApp < Sinatra::Base
  namespace '/tags' do
    get '' do
      page = params[:page] =~ /^\d+$/ ? params[:page].to_i : 1
      @tags = Tag.order('name ASC').page(page)

      if !@tags.empty?
        @page_title = page > 1 ? "Tags – Page #{page}" : 'Tags'

        erb :'tags/index'
      else
        404
      end
    end

    get '/:uri_name' do
      page = params[:page] =~ /^\d+$/ ? params[:page].to_i : 1

      if @tag = Tag.where(uri_name: params[:uri_name]).first
        @page_title = "Stories tagged “#{@tag.name}”"
        @stories = @tag.stories.paginate(page: page)

        erb :'tags/show'
      else
        404
      end
    end
  end
end