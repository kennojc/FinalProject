class CreateAuctions < ActiveRecord::Migration[6.1]
  def change
    create_table :auctions do |t|
      t.date :start
      t.date :end
      t.integer :round, :default => 1
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
