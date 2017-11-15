ENV['RACK_ENV'] ||= 'development'
# Bookmark Manager Web App
require 'sinatra/base'
require_relative 'datamapper_config'

class Bookmark < Sinatra::Base

  get '/' do
    redirect '/create_link'
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
    link_tag = params[:link_tag]
    tag = Tag.new(name: link_tag)
    link = Link.new(name: link_name, url: link_url)
    link.tags << tag
    link.save
    redirect '/links'
  end

 run! if app_file == $0

end
