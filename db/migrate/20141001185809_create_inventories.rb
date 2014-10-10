class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :item_id
      t.integer :inventory_amount

      t.timestamps
    end
  end
end
