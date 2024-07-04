require 'rails_helper'

RSpec.describe 'Breweries Index Page' do
	before(:each) do 
		@tlb = Brewery.create!(name: "Twin Lights", beers_on_tap: 8, pet_friendly: true)
    @kane = Brewery.create!(name: 'Kane', beers_on_tap: 15, pet_friendly: false)
	end

  # User story 1, parent index
  it 'displays the brewery name' do
    visit "/breweries"

    within("#breweries") do
      expect(page).to have_content(@tlb.name)
      expect(page).to have_content(@kane.name)
    end

    within("#brewery-#{@tlb.id}") do
      expect(page).to have_content(@tlb.name)
      expect(page).to_not have_content(@kane.name)
    end

    within("#brewery-#{@kane.id}") do
		  expect(page).to have_content(@kane.name)
      expect(page).to_not have_content(@tlb.name)
    end
  end
end 