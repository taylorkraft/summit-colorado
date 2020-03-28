class MountainsController < ApplicationController

    #display a list of all mountains
  get '/mountains' do
    @mountains = Mountain.all 

    erb :"mountains/index"
  end

  get '/mountains/new' do
    
  end

    #displays a specific mountain based on id
  get '/mountains/:id' do
      @mountain = Mountain.find_by_id(params[:id])
      if @mountain
        erb :"mountains/show"
      else
        redirect '/mountains'
      end
  end

  post '/mountains' do
    
  end
end