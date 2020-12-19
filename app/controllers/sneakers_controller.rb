class SneakersController < ApplicationController

    get "/sneakers" do
        # show all sneakers
    end

    get "/sneakers/brand" do
        # show all sneakers by a particular brand
    end

    get "/sneakers/sport"
        # show all sneakers by a particular brand
    end

    post "/newsneaker" do
        if session[:user_id]
            Sneaker.create(params)
            redirect to "/sneakers"
        else 
            redirect to "/failure"
        end
    end
    
end
