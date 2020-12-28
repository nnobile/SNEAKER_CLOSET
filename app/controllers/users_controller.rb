class UsersController < ApplicationController

    get '/signup' do
        erb :"users/new"
    end

    post '/signup' do
        user = User.new(params)
        if user.save
            session[:user_id] = user.id
            redirect '/sneakers'
          else
            @errors = user.errors.full_messages.join(" - ")
            erb :"users/new"
          end
    end

    get '/login' do
        erb :"users/login"
    end
    
    post '/login' do
        @user = User.find_by(:username => params[:username])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect '/sneakers'
        else
          erb :"users/login_failure"
        end
    end

    get '/logout' do
        session.clear
        erb :"/welcome"
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        erb :"users/show"
    end

end

