class AddBreweryToBeers < ActiveRecord::Migration[7.1]
  def change
    add_reference :beers, :brewery, null: false, foreign_key: true
  end
end
