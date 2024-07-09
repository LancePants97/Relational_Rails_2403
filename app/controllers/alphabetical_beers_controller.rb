class AlphabeticalBeersController < ApplicationController
  def index
    @brewery = Brewery.find(params[:brewery_id])
    @beers = @brewery.beers.alphabetical_order
  end
end