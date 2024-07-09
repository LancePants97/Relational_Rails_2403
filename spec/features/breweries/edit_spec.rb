require 'rails_helper'

RSpec.describe 'the breweries show page' do
	before(:each) do 
		@tlb = Brewery.create!(name: 'Twin Lights', beers_on_tap: 8, pet_friendly: true)
    @kane = Brewery.create!(name: 'Kane', beers_on_tap: 15, pet_friendly: false)

    @lager = @tlb.beers.create!(style_name: 'Lager', abv: 5, dry_hop: false)
		@dv = @tlb.beers.create!(style_name: 'Double Vision', abv: 6, dry_hop: true)
		@head_high = @kane.beers.create!(style_name: 'Head High', abv: 8, dry_hop: true)
	end
  # User Story 12
  it "can click a link on the brewery show page to update that brewery" do
    visit "/breweries/#{@tlb.id}"

    click_link "Update Brewery"

    expect(current_path).to eq("/breweries/#{@tlb.id}/edit")

    fill_in "name", with: "TLB"
    fill_in "beers_on_tap", with: "9"
   
    click_button "Update Brewery"

    expect(current_path).to eq "/breweries/#{@tlb.id}"

    expect(page).to have_content("TLB")
    expect(page).to have_content("9")
    expect(page).to have_content("Pet Friendly: false")
  end

  it "can click a link on the brewery show page to update that brewery" do
    visit "/breweries/#{@kane.id}"

    click_link "Update Brewery"

    expect(current_path).to eq("/breweries/#{@kane.id}/edit")

    fill_in "name", with: "Kane Brewing"
    fill_in "beers_on_tap", with: "13"
    check "Pet Friendly"
   
    click_button "Update Brewery"

    expect(current_path).to eq "/breweries/#{@kane.id}"

    expect(page).to have_content("Kane Brewing")
    expect(page).to have_content("13")
    expect(page).to have_content("Pet Friendly: true")
  end
end