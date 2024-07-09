class BreweryBeersController < ApplicationController
  def index
    @brewery = Brewery.find(params[:brewery_id])
    @beers = @brewery.beers
  end

  def new
    @brewery = Brewery.find(params[:brewery_id])
  end

  def create
    @brewery = Brewery.find(params[:brewery_id])
    beer = @brewery.beers.create!(brewery_beer_params)
    redirect_to "/breweries/#{@brewery.id}/beers"
  end

  private
  def brewery_beer_params
    params.permit(:style_name, :abv, :dry_hop)
  end
end