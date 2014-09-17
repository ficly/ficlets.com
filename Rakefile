require 'sinatra/activerecord/rake'
require './app'

desc 'Use wget to create an archive of the entire site'
task :archive do
  `wget --no-verbose --no-host-directories --directory-prefix=public/archive --recursive --level=475 --page-requisites --domains=localhost --no-parent localhost:9393`
end