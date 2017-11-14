# Link class for Bookmark Manager
require 'data_mapper'
require 'dm-migrations'
require 'dm-postgres-adapter'

class Link
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :url, String
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
Link.auto_upgrade!
