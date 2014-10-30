class OrderDetail < ActiveRecord::Base
belongs_to :order_summary
  has_one :items
validates :orderSummary_id, :item_id, :quantity, :item_price, presence: true
end
