class BeersController < ApplicationController
  def index
    @beers = Beer.all
  end

  def show
    @beer = Beer.find(params[:id])
  end

	def edit
		@beer = Beer.find(params[:id])
	end

	def update
		@beer = Beer.find(params[:id])
    if @beer.update(beer_params)
      redirect_to "/beers/#{@beer.id}"
    end
	end

	private
  def beer_params
    params.permit(:style_name, :abv, :dry_hop)
  end
end