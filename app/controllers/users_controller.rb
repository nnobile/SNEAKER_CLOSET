class UsersController < ApplicationController

    get '/signup' do
        erb :"users/new"
    end

    post '/signup' do
        @user = User.new(params[:user])
        if user.save
            session[:user_id] = user.id
            redirect '/sneakers'
          else
            binding.pry
            @errors = user.errors.full_messages.join(" - ")
            erb :"users/new"
          end
    end

    get '/login' do
        erb :"/login"
    end
    
    post '/login' do
        @user = User.find_by(:username => params[:username])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect '/sneakers'
        else
          erb :"users/failure"
        end
    end

    get '/logout' do
        session[:user_id] = nil
        redirect to '/login'
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        erb :"users/show"
    end

end

