require_relative 'datamapper_config'

def current_user
  session[:user] ||= User.all.last
end