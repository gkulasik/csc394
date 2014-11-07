class OrderDetail < ActiveRecord::Base
  belongs_to :order_summary
  belongs_to :item
validates :order_summary_id, :item_id, :quantity, :item_price, presence: true
end
