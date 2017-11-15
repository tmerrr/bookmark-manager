ENV['RACK_ENV'] ||= 'development'

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

  get '/tags/:tag' do
    query = params[:tag]
    @filtered_links = Tag.all(name: query).links
    erb :filtered_links
  end

  post '/links' do
    link_name = params[:link_name]
    link_url = params[:link_url]
    link = Link.new(name: link_name, url: link_url)
    params[:link_tag].split.each do |tag_name|
      tag = Tag.new(name: tag_name)
      link.tags << tag
    end
    link.save
    redirect '/links'
  end

 run! if app_file == $0

end
