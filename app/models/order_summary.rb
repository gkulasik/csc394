class OrderSummary < ActiveRecord::Base
belongs_to :customer
has_many :order_details, dependent: :destroy
has_one :checkout, dependent: :destroy
validates :customer_id, :order_date, :total_cost, presence: true
  
end
