# Bookmark Manager Web App
require 'sinatra/base'
require './models/link'

class Bookmark < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/links' do
    @links = Link.all
    erb(:links)
  end

 run! if app_file == $0

end
