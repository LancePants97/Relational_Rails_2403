require 'rails_helper'

RSpec.describe 'Breweries Index Page' do

     # User story 1, parent index
     it 'displays the brewery name' do
        tlb = Brewery.create!(name: "Twin Lights", beers_on_tap: 8, pet_friendly: true)
        kane = Brewery.create!(name: 'Kane', beers_on_tap: 15, pet_friendly: false)
        
        visit "/breweries/#{tlb.id}"
        save_and_open_page

        expect(page).to have_content(tlb.name)
        expect(page).to_not have_content(kane.name)
    end
end 