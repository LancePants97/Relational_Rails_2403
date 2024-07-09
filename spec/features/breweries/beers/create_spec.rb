require 'rails_helper'

RSpec.describe 'the breweries beer create page' do
	before(:each) do 
		@tlb = Brewery.create!(name: 'Twin Lights', beers_on_tap: 8, pet_friendly: true)
    @kane = Brewery.create!(name: 'Kane', beers_on_tap: 15, pet_friendly: false)

    @lager = @tlb.beers.create!(style_name: 'Lager', abv: 5, dry_hop: false)
		@dv = @tlb.beers.create!(style_name: 'Double Vision', abv: 6, dry_hop: true)
		@head_high = @kane.beers.create!(style_name: 'Head High', abv: 8, dry_hop: true)
  end

  # User Story 13
  it "can click a link in a brewery's beers index to create a new beer" do
    visit "/breweries/#{@tlb.id}/beers"
    
    click_link "Add New Beer"

    expect(current_path).to eq("/breweries/#{@tlb.id}/beers/new")

    fill_in "Style Name", with: "Euphoria"
    fill_in "ABV", with: "7"
    check "Dry Hop"

    click_button "Add Beer"

    expect(current_path).to eq("/breweries/#{@tlb.id}/beers")

    expect(page).to have_content("Euphoria")
    expect(page).to have_content("ABV: 7")
    expect(page).to have_content("Dry Hopped: true")
  end
end