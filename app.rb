require 'sinatra/asset_pipeline'
require 'will_paginate'
require 'will_paginate/active_record'

class FicletsApp < Sinatra::Base
  register Sinatra::Namespace
  register Sinatra::Partial
  register WillPaginate::Sinatra

  set :views, "#{settings.root}/app/views"

  enable :partial_underscores
  set :partial_template_engine, :erb

  set :assets_css_compressor, :sass
  set :assets_precompile, %w(application.css)
  set :assets_prefix, %w(app/assets)

  register Sinatra::AssetPipeline

  after do
    ActiveRecord::Base.connection.close
  end
end

Dir.glob('./config/initializers/*.rb', &method(:require))
Dir.glob('./app/**/*.rb', &method(:require))