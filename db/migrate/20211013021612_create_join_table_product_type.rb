class CreateJoinTableProductType < ActiveRecord::Migration[6.1]
  def change
    create_join_table :products, :types do |t|
       t.index [:product_id, :type_id]
       t.index [:type_id, :product_id]
    end
  end
end
