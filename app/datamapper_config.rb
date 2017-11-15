require 'data_mapper'
require 'dm-migrations'
require 'dm-postgres-adapter'

require './app/models/link'
require './app/models/tag'
require './app/models/user'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
