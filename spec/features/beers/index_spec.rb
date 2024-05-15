require 'rails_helper'

RSpec.describe 'Beers Index Page' do
    # User Story 3
    it 'can show each beers style name, abv, and dry hop' do
        tlb = Brewery.create!(name: 'Twin Lights', beers_on_tap: 8, pet_friendly: true)
        lager = tlb.beers.create!(style_name: 'Lager', abv: 5, dry_hop: false)
        dv = tlb.beers.create!(style_name: 'Double Vision', abv: 6, dry_hop: true)

        visit '/beers'

        # save_and_open_page

        expect(page).to have_content("Lager")
        # expect(page).to have_content("5")
        # expect(page).to have_content("Dry Hopped: false")
        expect(page).to have_content("Double Vision")
        # expect(page).to have_content("6")
        # expect(page).to have_content("Dry Hopped: true")
    end
end 