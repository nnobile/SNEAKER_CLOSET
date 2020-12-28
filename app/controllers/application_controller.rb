require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    erb :welcome
  end

  helpers do 
    
    def logged_in?
      !!session[:user_id]
    end
    
    def current_user
      @current_user ||= User.find_by(:id => session[:user_id]) if session[:user_id]
    end

  end
end

    # def redirect_to_if_logged_in
    #   redirect '/sneakers' if logged_in?
    # end

    # def redirect_to_if_not_logged_in
    #   redirect '/login' unless logged_in?
    # end


