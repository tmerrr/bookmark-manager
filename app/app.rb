ENV['RACK_ENV'] ||= 'development'
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

  get '/create_link' do
    erb(:creating_link)
  end

  post '/links' do
    link_name = params[:link_name]
    link_url = params[:link_url]
    Link.create(name: link_name, url: link_url)
    redirect '/links'
  end

 run! if app_file == $0

end
