class SneakersController < ApplicationController

    get "/sneakers" do
        @sneakers = Sneaker.all
        erb :"sneakers/index"
    end

    get "/sneakers/:id" do
        @sneaker = Sneaker.find_by(id: params[:id])
        erb :"sneakers/show"
    end

    get "/sneakers/brand" do
        # show all sneakers by a particular brand
    end

    get "/sneakers/sport" do
        # show all sneakers by a particular brand
    end

    post "/sneakers/newsneaker" do
        if session[:user_id]
            Sneaker.create(params)
            redirect to "/sneakers"
        else 
            redirect to "/failure"
        end
    end
    
end
