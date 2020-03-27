class MountainsController < ApplicationController

  get '/mountains' do
    @mountains = Mountain.all 

    erb :"mountains/index"
  end

  #get '/mountains/new' do
    
  #end

  get '/mountains/:id' do
      id = params[:id]
      @mountain = Mountain.find_by_id(id)
      if @mountain
        erb :"mountains/show"
      else
        redirect '/mountains'
      end
  end

  post '/mountains' do
    
  end
end