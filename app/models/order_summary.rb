class OrderSummary < ActiveRecord::Base
belongs_to: customer
has_many: order_detail
validates:customer_id, :order_date, :ship_date, :total_cost, presence: true
end
