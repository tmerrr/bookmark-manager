ENV['RACK_ENV'] ||= 'development'

require 'bcrypt'
require 'sinatra/base'
require_relative 'app_helper'

class Bookmark < Sinatra::Base
  enable :sessions
  set :session_secret, 'key'

  get '/' do
    redirect '/user/new'
  end

  get '/user/new' do
    erb :signup
  end

  get '/user/new/try-again'do
    @wrong_password = true
    erb :signup
  end

  get '/links' do
    @links = Link.all
    erb(:links)
  end

  get '/links/new' do
    erb(:new_link)
  end

  get '/tags/:tag' do
    @query = params[:tag]
    @filtered_links = Tag.all(name: @query).links
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

  post '/user' do
    email = params[:email]
    password = params[:password]
    password_confirmation = params[:password_confirmation]
    if password == password_confirmation
      user = User.create(email: email, password: password)
      session[:user_id] = user.id
      redirect '/links'
    else
      redirect '/user/new/try-again'
    end
  end

 run! if app_file == $0

end
