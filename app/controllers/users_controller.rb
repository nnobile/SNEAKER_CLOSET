class UsersController < ApplicationController

    get '/signup' do
        erb :"users/new"
    end

    post '/signup' do
        @user = User.new(params)
        if @user.save
            session[:user_id] = @user.id
            redirect to '/sneakers/new'
          else
            erb :"users/new"
          end
    end

    get '/login' do
        if logged_in?
            redirect '/sneakers'
        else
            erb :"users/login"
        end
    end
    
    post '/login' do
        @user = User.find_by(:username => params[:username])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect '/sneakers'
        else
            #possible flash notice here
            redirect '/signup'
        end
    end

    get '/logout' do
        if logged_in?
            session.clear
            redirect '/'
        end
    end

    # get '/users/:id' do
    #     @user = User.find_by(id: params[:id])
    #     erb :"users/show"
    # end

end

