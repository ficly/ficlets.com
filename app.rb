require 'active_support/all'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/namespace'

Dir.glob('./config/initializers/*.rb', &method(:require))

class FicletsApp < Sinatra::Base
  set :views, "#{settings.root}/app/views"

  register Sinatra::Namespace

  after do
    ActiveRecord::Base.connection.close
  end
end

Dir.glob('./app/**/*.rb', &method(:require))