class BreweriesController < ApplicationController
    def index
        @breweries = Brewery.all
    end

    def show

    end
end