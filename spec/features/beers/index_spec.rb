require 'rails_helper'

RSpec.describe 'Beers Index Page' do
	before(:each) do 
		@tlb = Brewery.create!(name: 'Twin Lights', beers_on_tap: 8, pet_friendly: true)
    @kane = Brewery.create!(name: 'Kane', beers_on_tap: 15, pet_friendly: false)
	
		@lager = @tlb.beers.create!(style_name: 'Lager', abv: 5, dry_hop: false)
		@dv = @tlb.beers.create!(style_name: 'Double Vision', abv: 6, dry_hop: true)
		@head_high = @kane.beers.create!(style_name: 'Head High', abv: 8, dry_hop: true)
		@sneakbox = @kane.beers.create!(style_name: 'Sneak Box', abv: 7, dry_hop: false)
	end

	# User Story 3
  it 'can show each beers style name, abv, and dry hop' do
    visit '/beers'

		within("#beer-#{@lager.id}") do
			expect(page).to have_content("Lager")
			expect(page).to have_content("5")
			expect(page).to have_content("Dry Hopped: false")
		end

		within("#beer-#{@dv.id}") do
			expect(page).to have_content("Double Vision")
			expect(page).to have_content("6")
			expect(page).to have_content("Dry Hopped: true")
		end

		within("#beer-#{@head_high.id}") do
			expect(page).to have_content("Head High")
			expect(page).to have_content("8")
			expect(page).to have_content("Dry Hopped: true")
		end
		
		within("#beer-#{@sneakbox.id}") do
			expect(page).to have_content("Sneak Box")
			expect(page).to have_content("7")
			expect(page).to have_content("Dry Hopped: false")
		end
  end
	# User Story 8
	it "displays a link to the beers index" do 
		visit "/breweries"

		click_link("All Beers")

		expect(current_path).to eq("/beers")
	end
end 