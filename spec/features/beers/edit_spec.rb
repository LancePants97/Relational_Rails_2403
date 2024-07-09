require 'rails_helper'

RSpec.describe 'the breweries edit page' do
	before(:each) do 
		@tlb = Brewery.create!(name: 'Twin Lights', beers_on_tap: 8, pet_friendly: true)
    @kane = Brewery.create!(name: 'Kane', beers_on_tap: 15, pet_friendly: false)

    @lager = @tlb.beers.create!(style_name: 'Lager', abv: 5, dry_hop: false)
		@dv = @tlb.beers.create!(style_name: 'Double Vision', abv: 6, dry_hop: true)
		@head_high = @kane.beers.create!(style_name: 'Head High', abv: 8, dry_hop: true)
	end

  # User Story 14
  it "can click a link on the beer show page to update that beer" do
    visit "/beers/#{@lager.id}"

    click_link "Update Beer"

    expect(current_path).to eq("/beers/#{@lager.id}/edit")

    fill_in "Style Name", with: "Twin Lights Lager"
    fill_in "ABV", with: "4"
    check "Dry Hop"

    click_button "Update Beer"
    
    expect(current_path).to eq "/beers/#{@lager.id}"

    expect(page).to have_content("Twin Lights Lager")
    expect(page).to have_content("4%")
    expect(page).to have_content("Dry Hopped: true")
  end
end