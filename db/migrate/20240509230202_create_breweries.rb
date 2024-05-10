class CreateBreweries < ActiveRecord::Migration[7.1]
  def change
    create_table :breweries do |t|
      t.string :name
      t.integer :beers_on_tap
      t.boolean :pet_friendly

      t.timestamps
    end
  end
end
