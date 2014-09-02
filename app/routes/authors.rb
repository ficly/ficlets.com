class FicletsApp < Sinatra::Base
  namespace '/authors' do
    get '' do
      page = params[:page] =~ /^\d+$/ ? params[:page] : 1
      @authors = Author.order('name ASC').page(page)

      if !@authors.empty?
        erb :'authors/index'
      else
        404
      end
    end

    get '/:uri_name' do
      uri_name = params[:uri_name]

      if @author = Author.where(uri_name: uri_name).first
        erb :'authors/show'
      else
        404
      end
    end
  end
end