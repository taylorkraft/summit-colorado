class SessionsController < ApplicationController

  get '/login' do
    if !logged_in?
      erb :'sessions/login'
    else
      redirect "/users/#{current_user.id}"
    end
  end

  post '/login' do
    login(params[:email], params[:password_digest])
    current_user
    redirect "/users/#{current_user.id}"
  end
  
  post '/sessions' do
    @user = User.find_by(email: params[:email], password_digest: params[:password_digest])
    if @user
      session[:user_id] = @user.id
      erb :"/sessions/home"
    else
      redirect '/login'
    end
  end
  
  get '/user/home/:id' do
    if !logged_in?
      redirect '/login'
    else
      @user = User.find_by_id(params[:id])
    erb :'/sessions/home'
    end
  end

  post '/logout' do
    puts "Logged Out User #{current_user.id}"
    session.clear
    redirect '/'
  end

end