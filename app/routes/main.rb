class FicletsApp < Sinatra::Base
  get '/' do
    erb :index
  end

  not_found do
    @page_title = '404'

    erb :'404'
  end
end