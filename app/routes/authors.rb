class FicletsApp < Sinatra::Base
  namespace '/authors' do
    get '' do
      page = params[:page] =~ /^\d+$/ ? params[:page].to_i : 1
      @authors = Author.order('name ASC').page(page)

      if !@authors.empty?
        @page_title = page > 1 ? "Authors – Page #{page}" : 'Authors'

        erb :'authors/index'
      else
        404
      end
    end

    get '/:uri_name' do
      uri_name = params[:uri_name]

      if @author = Author.where(uri_name: uri_name).first
        @page_title = @author.name

        erb :'authors/show'
      else
        404
      end
    end
  end
end