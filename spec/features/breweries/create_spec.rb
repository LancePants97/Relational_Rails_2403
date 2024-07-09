require 'rails_helper'

RSpec.describe 'the breweries create page' do
	before(:each) do 
		@tlb = Brewery.create!(name: 'Twin Lights', beers_on_tap: 8, pet_friendly: true)
    @kane = Brewery.create!(name: 'Kane', beers_on_tap: 15, pet_friendly: false)

    @lager = @tlb.beers.create!(style_name: 'Lager', abv: 5, dry_hop: false)
		@dv = @tlb.beers.create!(style_name: 'Double Vision', abv: 6, dry_hop: true)
		@head_high = @kane.beers.create!(style_name: 'Head High', abv: 8, dry_hop: true)
  end
  
  it "can click a link in the brewery index to create a new brewery" do
    visit "/breweries/"
    
    click_link "Add Brewery"

    expect(current_path).to eq("/breweries/new")

    fill_in "name", with: "Avery Brewing"
    fill_in "beers_on_tap", with: "30"
    check "Pet Friendly"

    click_button "Add Brewery"

    expect(current_path).to eq("/breweries")

    expect(page).to have_content("Avery Brewing")
  end
end
