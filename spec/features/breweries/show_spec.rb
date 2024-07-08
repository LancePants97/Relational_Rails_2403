require 'rails_helper'

RSpec.describe 'the breweries show page' do
	before(:each) do 
		@tlb = Brewery.create!(name: 'Twin Lights', beers_on_tap: 8, pet_friendly: true)
    @kane = Brewery.create!(name: 'Kane', beers_on_tap: 15, pet_friendly: false)

    @lager = @tlb.beers.create!(style_name: 'Lager', abv: 5, dry_hop: false)
		@dv = @tlb.beers.create!(style_name: 'Double Vision', abv: 6, dry_hop: true)
		@head_high = @kane.beers.create!(style_name: 'Head High', abv: 8, dry_hop: true)
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

  # User Story 7
  it "displays a count of the beers associated with this brewery" do 
    visit "/breweries/#{@tlb.id}"
    
    expect(page).to have_content("Total Beers Made: 2")
  end

  it "displays a count of the beers associated with this brewery" do 
    visit "/breweries/#{@kane.id}"
    
    expect(page).to have_content("Total Beers Made: 1")
  end

  # User Story 10
	it "displays a link to the beers index" do 
		visit "/breweries/#{@tlb.id}"
    
		click_link("Our Beers")
    
		expect(current_path).to eq("/breweries/#{@tlb.id}/beers")
	end

  it "displays a link to the beers index" do 
		visit "/breweries/#{@kane.id}"

		click_link("Our Beers")

		expect(current_path).to eq("/breweries/#{@kane.id}/beers")
	end
end