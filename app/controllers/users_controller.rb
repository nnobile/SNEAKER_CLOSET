class UsersController < ApplicationController

    get "/signup" do
        erb :"users/new"
    end

    post "/signup" do
        @user = User.new(:email => params[:email], :password => params[:password])
        if user.save
            session[:user_id] = user.id
            redirect "/sneakers"
          else
            redirect "/failure"
          end
    end
    
    post "/login" do
        @user = User.find_by(:email => params[:email])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect "/sneakers"
        else
          redirect "/failure"
        end
    end

    get "/logout" do
        session[:user_id] = nil
        redirect to "/loggedout"
    end

end

