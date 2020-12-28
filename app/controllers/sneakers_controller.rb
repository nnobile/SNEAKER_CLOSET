class SneakersController < ApplicationController

    get '/sneakers' do
        if logged_in?
            @sneakers = current_user.sneakers
            erb :'sneakers/user_index'
        else
            redirect 'users/signup' 
        end
    end

    get '/sneakers/new' do
        if logged_in?
            erb :"/sneakers/new"
        else
            redirect 'users/login'
        end
    end

    get '/sneakers/users/:user_id' do
        @current_id = session[:user_id]
        @sneakers = Sneaker.all
        erb :"/sneakers/user_index"
    end

    post '/sneakers' do 
        @sneaker = current_user.sneakers.create(:brand => params[:brand], :model => params[:model], :price => params[:price], :sport => params[:sport], :size => params[:size])
        if @sneaker.save
            redirect '/sneakers'
        else
            redirect '/sneakers/new'
        end
    end

    # post '/sneakers/users/:user_id' do
    #     if session[:user_id] == Sneaker.find_by(id: params[:id]).user_id
    #     erb :"sneakers/user_index"
    # end

    # post '/sneakers' do
    #     if logged_in?
    #     @sneaker = current_user.sneakers.create(params) Sneaker.create(:brand => params[:brand], :model => params[:model], :price => params[:price], :sport => params[:sport], :size => params[:size])
    #         redirect '/sneakers'
    #     else 
    #         erb :"users/unauthorized_failure"
    #     end
    # end

    get '/sneakers/:id' do
        @sneaker = Sneaker.find_by(id: params[:id])
        if @sneaker
            erb :"/sneakers/show"
        else 
            redirect '/sneakers'
        end
    end

    get '/sneakers/:id/edit' do
        @sneaker = Sneaker.find_by(id: params[:id])
        erb :"/sneakers/edit"
    end

    patch '/sneakers/:id/edit' do
        if session[:user_id] == Sneaker.find_by(id: params[:id]).user_id
            @sneaker = Sneaker.find_by(id: params[:id])
            @sneaker.update(params[:sneaker])
            redirect "sneakers/#{sneaker.id}"
        else
            erb :"/users/unauthorized_failure"
        end
    end

    delete '/sneakers/:id' do
        if session[:user_id] == Sneaker.find_by(id: params[:id]).user_id
            @sneaker = Sneaker.find_by(id: params[:id])
            @sneaker.destroy
            redirect "/sneakers"
        else
            erb :"/users/unauthorized_failure"
        end
    end

end
