require 'active_support/all'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/asset_pipeline'
require 'sinatra/namespace'
require 'will_paginate'
require 'will_paginate/active_record'

Dir.glob('./config/initializers/*.rb', &method(:require))

class FicletsApp < Sinatra::Base
  set :views, "#{settings.root}/app/views"

  set :assets_css_compressor, :sass
  set :assets_precompile, %w(application.css)
  set :assets_prefix, %w(app/assets)

  register Sinatra::AssetPipeline
  register Sinatra::Namespace
  register WillPaginate::Sinatra

  after do
    ActiveRecord::Base.connection.close
  end
end

Dir.glob('./app/**/*.rb', &method(:require))