require 'rails_helper'

RSpec.describe 'the breweries show page' do
	before(:each) do 
		@tlb = Brewery.create!(name: 'Twin Lights', beers_on_tap: 8, pet_friendly: true)
    @kane = Brewery.create!(name: 'Kane', beers_on_tap: 15, pet_friendly: false)
	end
  # User Story 2
  it 'can show the brewerys name, beers on tap, and pet friendly status' do    
    visit "/breweries/#{@tlb.id}"


    expect(page).to have_content("Twin Lights")
    expect(page).to have_content("8")
    expect(page).to have_content("Pet Friendly: true")

    expect(page).to_not have_content("Kane")
    expect(page).to_not have_content("15")
    expect(page).to_not have_content("Pet Friendly: false")
  end

  it 'can show another brewerys name, beers on tap, and pet friendly status' do 
    visit "/breweries/#{@kane.id}"

    expect(page).to_not have_content("Twin Lights")
  	expect(page).to_not have_content("8")
  	expect(page).to_not have_content("Pet Friendly: true")

  	expect(page).to have_content("Kane")
  	expect(page).to have_content("15")
  	expect(page).to have_content("Pet Friendly: false")
	end
end