require 'rails_helper'

RSpec.describe 'the beers show page' do
    # User story 4, child show
    it 'displays the beer style' do
        brewery = Brewery.create!(name: "Twin Lights", beers_on_tap: 8, pet_friendly: true)
        beer = brewery.beers.create!(style_name: "Lager", abv: 5, dry_hop: false)
        beer_2 = brewery.beers.create!(style_name: "Double Vision", abv: 6, dry_hop: true)
        
        visit "/beers/#{beer.id}"

        expect(page).to have_content(beer.style_name)
        expect(page).to_not have_content(beer_2.style_name)
    end

    it 'displays the name of the brewery making the beer' do
        brewery = Brewery.create!(name: "Twin Lights", beers_on_tap: 8, pet_friendly: true)
        beer = brewery.beers.create!(style_name: "Lager", abv: 5, dry_hop: false)
        beer_2 = brewery.beers.create!(style_name: "Double Vision", abv: 6, dry_hop: true)
        
        visit "/beers/#{beer.id}"
        # save_and_open_page

        expect(page).to have_content(brewery.name)
    end
end