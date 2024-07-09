class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.order_by_recently_created
	end
  
  def new
  end

  def create 
    @brewery = Brewery.create!(brewery_params)
    redirect_to "/breweries"
  end

  def show
    @brewery = Brewery.find(params[:id])
  end

  def edit
    @brewery = Brewery.find(params[:id])
  end

  def update
    @brewery = Brewery.find(params[:id])
    if @brewery.update(brewery_params)
      redirect_to "/breweries/#{@brewery.id}"
    end
  end

  private
  def brewery_params
    params.permit(:name, :beers_on_tap, :pet_friendly)
  end
end