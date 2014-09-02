class FicletsApp < Sinatra::Base
  namespace '/authors' do
    get '' do
      @authors = Author.order('name ASC')

      erb :'authors/index'
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