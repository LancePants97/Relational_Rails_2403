require 'rails_helper'

RSpec.describe Beer do
  it {should belong_to :brewery}

	describe "class methods" do
		it "self.only_true" do
			tlb = Brewery.create!(name: 'Twin Lights', beers_on_tap: 8, pet_friendly: true)
			kane = Brewery.create!(name: 'Kane', beers_on_tap: 15, pet_friendly: false)
	
			lager = tlb.beers.create!(style_name: 'Lager', abv: 5, dry_hop: false)
			dv = tlb.beers.create!(style_name: 'Double Vision', abv: 6, dry_hop: true)
			head_high = kane.beers.create!(style_name: 'Head High', abv: 8, dry_hop: true)
			sneakbox = kane.beers.create!(style_name: 'Sneak Box', abv: 7, dry_hop: false)

			beers = Beer.all
			expect(beers.only_true).to eq([dv, head_high])
		end
		it 'self.alphabetical_order' do
			tlb = Brewery.create!(name: 'Twin Lights', beers_on_tap: 8, pet_friendly: true)
			kane = Brewery.create!(name: 'Kane', beers_on_tap: 15, pet_friendly: false)
	
			lager = tlb.beers.create!(style_name: 'Lager', abv: 5, dry_hop: false)
			dv = tlb.beers.create!(style_name: 'Double Vision', abv: 6, dry_hop: true)
			head_high = kane.beers.create!(style_name: 'Head High', abv: 8, dry_hop: true)
			sneakbox = kane.beers.create!(style_name: 'Sneak Box', abv: 7, dry_hop: false)

			expect(tlb.beers.alphabetical_order).to eq([dv, lager])
			expect(kane.beers.alphabetical_order).to eq([head_high, sneakbox])

		end
	end
end