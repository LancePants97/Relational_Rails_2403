Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/beers', to: 'beers#index'
  get '/beers/:id', to: 'beers#show'
  get '/breweries', to: 'breweries#show'
  get '/breweries/:brewery_id/beers', to: 'brewery_beers#index'
end
