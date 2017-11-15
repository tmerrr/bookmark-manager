# Link class for Bookmark Manager
# require 'data_mapper'
# require 'dm-migrations'
# require 'dm-postgres-adapter'

class Tag
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  has n, :links, :through => Resource
end
