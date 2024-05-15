require 'rails_helper'

RSpec.describe 'Breweries beers index' do
    before :each do 
        @tlb = Brewery.create!(name: 'Twin Lights')
        @lager = @tlb.beers.create!(style_name: 'Lager', abv: 5, dry_hop: false)
        @dv = @tlb.beers.create!(style_name: 'Double Vision', abv: 6, dry_hop: true)
    end

    # User story 5
    it 'shows all of the beer names for the brewery' do
        visit "/breweries/#{@tlb.id}/beers"

        expect(page).to have_content(@lager.style_name)
        expect(page).to have_content(@dv.style_name)
    end

    # User story 6
    it 'links to each beers show page' do
        visit "/breweries/#{@tlb.id}/beers"

        click_on @lager.style_name

        expect(current_path).to eq("/beers/#{@lager.id}")
    end
end