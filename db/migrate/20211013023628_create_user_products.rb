class CreateUserProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :user_products do |t|
      t.integer :final_price
      t.datetime :adjudication
      t.boolean :paid, :default => false
      t.string :token
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
