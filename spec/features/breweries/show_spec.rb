require 'rails_helper'

RSpec.describe 'the beers show page' do
    # User Story 2
    it 'can show each brewerys name, beers on tap, and pet friendly status' do
        tlb = Brewery.create!(name: 'Twin Lights', beers_on_tap: 8, pet_friendly: true)
        kane = Brewery.create!(name: 'Kane', beers_on_tap: 15, pet_friendly: false)
        
        visit "/breweries/#{tlb.id}"

        save_and_open_page

        expect(page).to have_content("Twin Lights")
        expect(page).to have_content("8")
        expect(page).to have_content("Pet Friendly: true")
        expect(page).to have_content("Kane")
        expect(page).to have_content("15")
        expect(page).to have_content("Pet Friendly: false")
    end
end