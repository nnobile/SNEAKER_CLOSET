class SneakersController < ApplicationController

    get '/sneakers/new' do
        erb :"sneakers/new"
    end

    get '/sneakers' do
        if logged_in?
            id_val = session[:user_id]
            @sneakers = Sneaker.where(id: id_val)
        else
           @sneakers = Sneaker.all
            erb :"sneakers/index"
        end
    end

    get '/sneakers/:id' do
        @sneaker = Sneaker.find_by(id: params[:id])
        if @sneaker
            erb :"sneakers/show"
        else 
            redirect '/sneakers'
        end
    end

    post '/sneakers' do
        if session[:user_id]
            Sneaker.create(params)
            redirect to '/sneakers'
        else 
            redirect to '/failure'
        end
    end

    get '/sneakers/:id/edit' do
        @sneaker = Sneaker.find_by(id: params[:id])
        erb :"sneakers/edit"
    end

    patch '/sneakers/:id/edit' do
        @sneaker = Sneaker.find_by(id: params[:id])
        @sneaker.update(params[:sneaker])
        redirect to "sneakers/#{sneaker.id}"
    end

    delete '/sneakers/:id' do
        @sneaker = Sneaker.find_by(id: params[:id])
        @sneaker.destroy
        redirect "/sneakers"
    end

end
