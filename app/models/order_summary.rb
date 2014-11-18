class OrderSummary < ActiveRecord::Base
belongs_to :customer
has_many :order_details, dependent: :destroy
has_one :checkout, dependent: :destroy
validates :customer_id, :order_date, :total_cost, presence: true
validate :ship_and_order_date
  
  def ship_and_order_date
    if !self.ship_date.nil?
      if self.order_date > self.ship_date
        errors.add(:ship_date, "cannot be before order date.")
      end
    end
  end
end
