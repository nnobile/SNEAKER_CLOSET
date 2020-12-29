class SneakersController < ApplicationController

    get '/sneakers' do
        if logged_in?
            @sneakers = current_user.sneakers
            erb :"/sneakers/user_index"
        else
            redirect to '/signup'
        end
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

    # get '/sneakers/users/:user_id' do
    #     @current_id = session[:user_id]
    #     @sneakers = Sneaker.all
    #     erb :"/sneakers/user_index"
    # end

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
            if current_user.id == @sneaker.user_id
            erb :"/sneakers/edit"
        else
            redirect to '/login'
        end
       end
    end

    patch '/sneakers/:id/edit' do
        if logged_in?
            @sneaker = Sneaker.find_by(id: params[:id])
            @sneaker.brand = params[:brand]
            @sneaker.model = params[:model]
            @sneaker.sport = params[:sport]
            @sneaker.price = params[:price]
            @sneaker.size = params[:size]
            @sneaker.save
            redirect to "/sneakers/#{sneaker.id}"
        else
            erb :"/users/unauthorized_failure"
        end
    end

    delete '/sneakers/:id' do
        if session[:user_id] == Sneaker.find_by(id: params[:id]).user_id
            @sneaker = Sneaker.find_by(id: params[:id])
            @sneaker.destroy
            redirect to '/sneakers'
        else
            erb :"/users/unauthorized_failure"
        end
    end
end