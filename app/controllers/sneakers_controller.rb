class SneakersController < ApplicationController

    get '/sneakers/new' do
        erb :"sneakers/new"
    end

    post '/sneakers' do
        @sneaker = Sneaker.create(:brand => params[:brand], :model => params[:model], :price => params[:price], :sport => params[:sport], :size => params[:size])
        redirect '/sneakers'
    end

    get '/sneakers' do
        @sneakers = Sneaker.all
        erb :"sneakers/index"
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

    # get '/sneakers/brand' do
        # show all sneakers by a particular brand
    # end

    # get '/sneakers/sport' do
        # show all sneakers by a particular sport
    #end

end
