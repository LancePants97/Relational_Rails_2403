class CreateBeers < ActiveRecord::Migration[7.1]
  def change
    create_table :beers do |t|
      t.string :style_name
      t.integer :abv
      t.boolean :dry_hop

      t.timestamps
    end
  end
end
