require 'active_support/all'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/asset_pipeline'
require 'sinatra/namespace'
require 'sinatra/partial'
require 'will_paginate'
require 'will_paginate/active_record'

Dir.glob('./config/initializers/*.rb', &method(:require))

class FicletsApp < Sinatra::Base
  I18n.enforce_available_locales = false

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

Dir.glob('./app/**/*.rb', &method(:require))