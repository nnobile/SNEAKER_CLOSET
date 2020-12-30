class SneakersController < ApplicationController

    get '/sneakers' do
        if logged_in?
            @sneakers = current_user.sneakers
            erb :"/sneakers/index"
        else
            @sneakers = Sneaker.all
            erb :"/allsneakers"
        end
    end

    get '/sneakers' do
        @sneakers = Sneaker.all
        erb :"/allsneakers"
    end

    get '/sneakers/new' do
        if logged_in?
            erb :"/sneakers/new"
        else
            redirect to '/login'
        end
    end

    get '/sneakers/:id' do
        if logged_in?
            @sneaker = Sneaker.find_by(id: params[:id])
            erb :"/sneakers/show"
        else 
            redirect to '/login'
        end
    end

    get '/sneakers/users/:user_id' do
        if logged_in?
            @sneakers = current_user.sneakers
            erb :"/sneakers/index"
        else
            redirect to '/login'
        end
    end

    post '/sneakers' do 
        if logged_in?
            @sneaker = current_user.sneakers.create(params)
            #possible flash message
            redirect to '/sneakers'
        else
            erb :"/sneakers/new"
        end
    end

    get '/sneakers/:id/edit' do
        if logged_in?
            @sneaker = Sneaker.find_by(id: params[:id])
            if @current_user.id == @sneaker.user_id
            erb :"/sneakers/edit"
        else
            redirect to '/login'
        end
       end
    end

    patch '/sneakers/:id/edit' do
        if logged_in?
            @sneaker = Sneaker.find_by(id: params[:id])
            if current_user.id == @sneaker.user_id
            @sneaker.brand = params[:brand]
            @sneaker.model = params[:model]
            @sneaker.sport = params[:sport]
            @sneaker.price = params[:price]
            @sneaker.size = params[:size]
            @sneaker.save
            redirect to "/sneakers/#{@sneaker.id}"
            end
        else
            erb :"/users/unauthorized_failure"
        end
    end

    delete '/sneakers/:id/delete' do
        if logged_in?
            @sneaker = Sneaker.find_by(id: params[:id])
            if current_user.id == @sneaker.user_id
            @sneaker.destroy
            redirect to '/sneakers'
            end
        else
            erb :"/users/unauthorized_failure"
        end
    end
end