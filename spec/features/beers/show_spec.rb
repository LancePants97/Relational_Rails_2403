require 'rails_helper'

RSpec.describe 'the beers show page' do
    # User story 4, child show
    it 'displays the beer style' do
        brewery = Brewery.create!(name: "Twin Lights", beers_on_tap: 8, pet_friendly: true)
        beer = brewery.beers.create!(style_name: "Lager", abv: 5, dry_hop: false)
        beer_2 = brewery.beers.create!(style_name: "Double Vision", abv: 6, dry_hop: true)
        
        visit "/beers/#{beer.id}"
        # save_and_open_page

        expect(page).to have_content(beer.style_name)
        expect(page).to have_content("Lager")
        expect(page).to have_content(beer.abv)
        expect(page).to have_content("5")
        expect(page).to have_content(beer.dry_hop)
        expect(page).to have_content("Dry Hopped: false")
        # expect(page).to have_content("Double Vision")
        # # expect(page).to have_content("6")
        # # expect(page).to have_content("Dry Hopped: true")
        expect(page).to_not have_content(beer_2.style_name)
    end

    it 'displays the beer style' do
        brewery = Brewery.create!(name: "Twin Lights", beers_on_tap: 8, pet_friendly: true)
        beer = brewery.beers.create!(style_name: "Lager", abv: 5, dry_hop: false)
        beer_2 = brewery.beers.create!(style_name: "Double Vision", abv: 6, dry_hop: true)
        
        visit "/beers/#{beer_2.id}"
        # save_and_open_page

        expect(page).to_not have_content(beer.style_name)
        expect(page).to_not have_content("Lager")
        expect(page).to_not have_content(beer.abv)
        expect(page).to_not have_content("5")
        expect(page).to_not have_content(beer.dry_hop)
        expect(page).to_not have_content("Dry Hopped: false")

        expect(page).to have_content(beer_2.style_name)
        expect(page).to have_content("Double Vision")
        expect(page).to have_content(beer_2.style_name)
        expect(page).to have_content("6")
        expect(page).to have_content("Dry Hopped: true")
    end

    
end