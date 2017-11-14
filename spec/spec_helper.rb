ENV['RACK_ENV'] = 'TEST'

require './server.rb'
require 'capybara'
require 'capybara/rspec'
require 'rspec'

Capybara.app = Bookmark
