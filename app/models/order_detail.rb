class OrderDetail < ActiveRecord::Base
belongs_to: order_summary
has_many: item
add_index: item_id
validates: orderSummary_id, :item_id, :quantity, :item_price, presence: true
end
