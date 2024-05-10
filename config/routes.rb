Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/beers', to: 'beers#index'
  get '/beers/:id', to: 'beers#show'
end
