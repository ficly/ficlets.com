require 'active_support/all'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/namespace'
require 'will_paginate'
require 'will_paginate/active_record'

Dir.glob('./config/initializers/*.rb', &method(:require))

class FicletsApp < Sinatra::Base
  set :views, "#{settings.root}/app/views"

  register Sinatra::Namespace
  register WillPaginate::Sinatra

  after do
    ActiveRecord::Base.connection.close
  end
end

Dir.glob('./app/**/*.rb', &method(:require))