class MountainsController < ApplicationController

  get '/mountains' do
    @mountains = Mountain.all 

    erb :"mountains/index"
  end

  get '/mountains/new' do
    
  end

  get '/mountains/:id' do
    
  end

  post '/mountains' do
    
  end
end