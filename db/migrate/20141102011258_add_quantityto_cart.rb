class AddQuantitytoCart < ActiveRecord::Migration
  def change
    add_column :carts, :quantity, :integer, :default => 1
    add_index :carts, [:customer_id, :item_id]
    remove_column :customers, :admin
    add_column :customers, :admin, :boolean, :default => false
  end
end
