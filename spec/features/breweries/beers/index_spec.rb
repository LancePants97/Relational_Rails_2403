require 'rails_helper'

RSpec.describe 'Breweries beers index' do
  before(:each) do 
		@tlb = Brewery.create!(name: 'Twin Lights', beers_on_tap: 8, pet_friendly: true)
    @kane = Brewery.create!(name: 'Kane', beers_on_tap: 15, pet_friendly: false)
	
		@lager = @tlb.beers.create!(style_name: 'Lager', abv: 5, dry_hop: false)
		@dv = @tlb.beers.create!(style_name: 'Double Vision', abv: 6, dry_hop: true)
		@head_high = @kane.beers.create!(style_name: 'Head High', abv: 8, dry_hop: true)
		@sneakbox = @kane.beers.create!(style_name: 'Sneak Box', abv: 7, dry_hop: false)
	end

  # User story 5
  it 'shows all of the beer names for the brewery' do
    visit "/breweries/#{@tlb.id}/beers"

    expect(page).to have_content(@lager.style_name)
		expect(page).to have_content("ABV: #{@lager.abv}")
		expect(page).to have_content("Dry Hopped: #{@lager.dry_hop}")

    expect(page).to have_content(@dv.style_name)
		expect(page).to have_content("ABV: #{@dv.abv}")
		expect(page).to have_content("Dry Hopped: #{@dv.dry_hop}")
  end

	it 'shows all of the beer names for another brewery' do
		visit "/breweries/#{@kane.id}/beers"
	
		expect(page).to have_content(@head_high.style_name)
		expect(page).to have_content("ABV: #{@head_high.abv}")
		expect(page).to have_content("Dry Hopped: #{@head_high.dry_hop}")
	
		expect(page).to have_content(@sneakbox.style_name)
		expect(page).to have_content("ABV: #{@sneakbox.abv}")
		expect(page).to have_content("Dry Hopped: #{@sneakbox.dry_hop}")
	end
end