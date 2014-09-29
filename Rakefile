require 'sinatra/activerecord/rake'
require 'sinatra/asset_pipeline/task'
require './app'

Sinatra::AssetPipeline::Task.define! FicletsApp

desc 'Use wget to create an archive of the entire site'
task :archive do
  puts 'You may want to run this in production mode:'
  puts 'RACK_ENV=production rake assets:clean assets:precompile'
  puts 'RACK_ENV=production rackup'

  `wget --content-on-error --directory-prefix=tmp localhost:9292/404.html`
  `wget --no-verbose --no-host-directories --directory-prefix=tmp --adjust-extension --recursive --level=500 --page-requisites --domains=localhost --no-parent localhost:9292`
end