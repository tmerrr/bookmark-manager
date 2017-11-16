require_relative 'datamapper_config'

def current_user
  @current_user ||= User.get(session[:user_id])
end
