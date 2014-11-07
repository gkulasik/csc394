class FixOrderDetails < ActiveRecord::Migration
  def change
    remove_column :order_details, :orderSummary_id
    add_column :order_details, :order_summary_id, :integer
  end
end
