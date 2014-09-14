config = YAML.load_file('config/database.yml')

puts 'Emptying database...'
Author.delete_all
Story.delete_all
Comment.delete_all

['authors', 'stories', 'comments'].each do |filename|
  puts "Importing #{filename}..."
  `mysql -u#{config['username']} -p#{config['password']} #{config['database']} < db/seeds/#{filename}.sql`
end