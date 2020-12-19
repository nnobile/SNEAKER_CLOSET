class UsersController < ApplicationController

    get "/signup" do
        erb :"users/new"
    end

    post "/signup" do
        binding.pry
        user = User.new(:email => params[:email], :password => params[:password])
        if user.save
            sessions[:user_id] = :user_id
            redirect "/sneakers"
          else
            redirect "/failure"
          end
    end
end

