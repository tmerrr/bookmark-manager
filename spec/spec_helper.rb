ENV['RACK_ENV'] = 'TEST'
require './lib/link'
require './server.rb'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'data_mapper'
require 'dm-migrations'
require 'dm-postgres-adapter'


Capybara.app = Bookmark

RSpec.configure do |config|
    DataMapper.setup(:default, 'postgres://localhost/bookmark_test')
    DataMapper.finalize
    Link.auto_migrate!
end
