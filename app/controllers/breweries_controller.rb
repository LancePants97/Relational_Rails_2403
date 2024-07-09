class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.order_by_recently_created
	end

  def show
    @brewery = Brewery.find(params[:id])
  end

  def edit
    @brewery = Brewery.find(params[:id])
  end

  def update
    @brewery = Brewery.find(params[:id])
    if @brewery.update(name: params[:name], 
                    beers_on_tap: params[:beers_on_tap], 
                    pet_friendly: params[:pet_friendly])
      redirect_to "/breweries/#{@brewery.id}"
    end
  end
end