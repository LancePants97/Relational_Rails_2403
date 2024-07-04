class BreweriesController < ApplicationController
    def index
        @breweries = Brewery.all
        # binding.pry
    end

    def show
        @brewery = Brewery.find(params[:id])
    end
end