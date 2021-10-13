class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :lowest_price
      t.binary :image
      t.text :description
      t.integer :stock, :default => 1
      t.boolean :certificate
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
