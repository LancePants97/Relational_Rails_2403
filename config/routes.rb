Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/beers', to: 'beers#index'
  get '/beers/:id', to: 'beers#show'
  get '/breweries', to: 'breweries#index'
  get '/breweries/new', to: 'breweries#new'
  post '/breweries', to: 'breweries#create'
  get '/breweries/:id', to: 'breweries#show'
  get '/breweries/:id/edit', to: 'breweries#edit'
  patch '/breweries/:id', to: 'breweries#update'
  get '/breweries/:brewery_id/beers', to: 'brewery_beers#index'
  get '/breweries/:brewery_id/beers/new', to: 'brewery_beers#new'
  post '/breweries/:brewery_id/beers', to: 'brewery_beers#create'

end
