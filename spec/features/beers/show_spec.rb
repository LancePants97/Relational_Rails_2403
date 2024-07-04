require 'rails_helper'

RSpec.describe 'the beers show page' do
  before(:each) do 
		@tlb = Brewery.create!(name: 'Twin Lights', beers_on_tap: 8, pet_friendly: true)
    @kane = Brewery.create!(name: 'Kane', beers_on_tap: 15, pet_friendly: false)
	
		@lager = @tlb.beers.create!(style_name: 'Lager', abv: 5, dry_hop: false)
		@dv = @tlb.beers.create!(style_name: 'Double Vision', abv: 6, dry_hop: true)
		@head_high = @kane.beers.create!(style_name: 'Head High', abv: 8, dry_hop: true)
		@sneakbox = @kane.beers.create!(style_name: 'Sneak Box', abv: 7, dry_hop: false)
	end

  # User story 4, child show
  it 'displays the beer style' do
    visit "/beers/#{@lager.id}"

    expect(page).to have_content("Lager")
    expect(page).to have_content("ABV: 5")
    expect(page).to have_content("Dry Hopped: false")

		expect(page).to_not have_content("Double Vision")
    expect(page).to_not have_content("ABV: 6")
    expect(page).to_not have_content("Dry Hopped: true")
	end

	it 'displays the beer style' do
    visit "/beers/#{@dv.id}"

    expect(page).to have_content("Double Vision")
    expect(page).to have_content("ABV: 6")
    expect(page).to have_content("Dry Hopped: true")

		expect(page).to_not have_content("Lager")
    expect(page).to_not have_content("ABV: 5")
    expect(page).to_not have_content("Dry Hopped: false")
  end

	it 'displays the beer style' do
    visit "/beers/#{@head_high.id}"

    expect(page).to have_content("Head High")
    expect(page).to have_content("ABV: 8")
    expect(page).to have_content("Dry Hopped: true")

		expect(page).to_not have_content("Sneak Box")
    expect(page).to_not have_content("ABV: 7")
    expect(page).to_not have_content("Dry Hopped: false")
  end

	it 'displays the beer style' do
    visit "/beers/#{@sneakbox.id}"

    expect(page).to have_content("Sneak Box")
    expect(page).to have_content("ABV: 7")
    expect(page).to have_content("Dry Hopped: false")

		expect(page).to_not have_content("Head High")
    expect(page).to_not have_content("ABV: 8")
    expect(page).to_not have_content("Dry Hopped: true")
  end
end