class UsersController < ApplicationController

    get "/signup" do
        erb :"users/new"
    end

    post "/signup" do
        binding.pry
        user = User.create(params[:user])
        session[:user_id] = user.id
        redirect to "/sneakers"
    end
end

