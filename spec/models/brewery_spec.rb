require 'rails_helper'

RSpec.describe Brewery do
  it {should have_many :beers}

  describe "class methods" do 
    it "self.order_by_recently_created" do 
      tlb = Brewery.create!(name: "Twin Lights", beers_on_tap: 8, pet_friendly: true)
      kane = Brewery.create!(name: "Kane", beers_on_tap: 15, pet_friendly: false)
      new_brewery = Brewery.create!(name: "Avery Brewing", beers_on_tap: 30, pet_friendly: true)

      breweries = Brewery.all
      expect(breweries.order_by_recently_created).to eq([new_brewery, kane, tlb])
    end
  end

  describe "instance methods" do 
    it "beer_count" do 
      tlb = Brewery.create!(name: 'Twin Lights', beers_on_tap: 8, pet_friendly: true)
      kane = Brewery.create!(name: 'Kane', beers_on_tap: 15, pet_friendly: false)
  
      lager = tlb.beers.create!(style_name: 'Lager', abv: 5, dry_hop: false)
      dv = tlb.beers.create!(style_name: 'Double Vision', abv: 6, dry_hop: true)
      head_high = kane.beers.create!(style_name: 'Head High', abv: 8, dry_hop: true)

      expect(tlb.beer_count).to eq(2)
      expect(kane.beer_count).to eq(1)
    end
  end
end


