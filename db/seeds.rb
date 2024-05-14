# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Beer.destroy_all
Brewery.destroy_all

@tlb = Brewery.create!(name: 'Twin Lights', beers_on_tap: 8, pet_friendly: true)
@lager = @tlb.beers.create!(style_name: 'Lager', abv: 5, dry_hop: false)
@dv = @tlb.beers.create!(style_name: 'Double Vision', abv: 6, dry_hop: true)

@kane = Brewery.create!(name: 'Kane', beers_on_tap: 15, pet_friendly: false)
@m_gold = @tlb.beers.create!(style_name: 'Monmouth Gold', abv: 4, dry_hop: false)
@head_high = @tlb.beers.create!(style_name: 'Head High', abv: 8, dry_hop: true)
