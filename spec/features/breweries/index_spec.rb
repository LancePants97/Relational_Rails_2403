require 'rails_helper'

RSpec.describe 'Breweries Index Page' do
	before(:each) do 
		@tlb = Brewery.create!(name: "Twin Lights", beers_on_tap: 8, pet_friendly: true)
    @kane = Brewery.create!(name: "Kane", beers_on_tap: 15, pet_friendly: false)
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

  # User Story 6
  it "displays the parents in order of most recently created and shows when each was created" do
    new_brewery = Brewery.create!(name: "Avery Brewing", beers_on_tap: 30, pet_friendly: true)
    visit "/breweries"

    within("#breweries") do
      expect(new_brewery.name).to appear_before(@kane.name)
      expect(@kane.name).to appear_before(@tlb.name)
    end

    within("#brewery-#{@tlb.id}") do
      expect(page).to have_content(@tlb.created_at)
    end

    within("#brewery-#{@kane.id}") do
      expect(page).to have_content(@kane.created_at)
    end
  end

  # User Story 9
	it "displays a link to the breweries index" do 
		visit "/beers"

		click_link("Breweries")

		expect(current_path).to eq("/breweries")
	end
end 