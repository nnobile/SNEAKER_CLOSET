require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    erb :welcome
  end

  helpers do 
    def logged_in?
      !!session[:user_id]
    end
  end

  # def current_user
  #   if @current_user
  #     @current_user
  #   else 
  #     @current_user = User.find_by(id: session[:user_id])
  #   end
  # end

end
