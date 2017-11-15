require './app/app'
require './app/datamapper_config'

namespace :db do
  desc 'Destructive upgrade'
  task :migrate do
    DataMapper.auto_migrate!
    puts "auto_migrate! completed"
  end

  desc 'Non destructive upgrade'
  task :upgrade do
    DataMapper.auto_upgrade!
    puts "auto_upgrade! completed"
  end
end
