class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :customer_id
      t.integer :item_id

      t.timestamps
    end
  end
end
