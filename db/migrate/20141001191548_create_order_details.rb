class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.integer :orderSummary_id
      t.integer :item_id
      t.integer :quantity
      t.decimal :item_price

      t.timestamps
    end
  end
end
