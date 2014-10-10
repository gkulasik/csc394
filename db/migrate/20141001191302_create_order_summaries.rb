class CreateOrderSummaries < ActiveRecord::Migration
  def change
    create_table :order_summaries do |t|
      t.integer :customer_id
      t.datetime :order_date
      t.datetime :ship_date
      t.decimal :total_cost

      t.timestamps
    end
  end
end
