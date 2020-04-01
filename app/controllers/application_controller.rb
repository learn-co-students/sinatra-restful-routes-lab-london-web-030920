class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #INDEX
  get '/recipes' do 
    
    @recipes = Recipe.all

    erb :index
  end

#CREATE
  get '/recipes/new' do 

  erb :new
  end

  #CREATE
  post '/recipes' do 
    @recipe= Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])

    redirect to "/recipes/#{@recipe.id}"
  end

  
  #SHOW
  get '/recipes/:id' do
    @recipe= Recipe.find_by_id(params[:id])

    erb :show
  end

  get '/recipes/:id/:edit' do 
    @recipe= Recipe.find_by_id(params[:id])

    erb :edit
    
  end

  patch '/recipes/:id' do 
    @recipe= Recipe.find_by_id(params[:id])
    @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])

   redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete

    redirect to "/recipes"
  end

end
