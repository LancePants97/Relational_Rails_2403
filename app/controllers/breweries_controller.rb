class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.order_by_recently_created
	end

  def show
    @brewery = Brewery.find(params[:id])
  end
end