class Cart < ActiveRecord::Base
belongs_to :customer
belongs_to :item
validates :customer_id, :item_id, :quantity, presence: true
validates :quantity, numericality: { greater_than: 0 }

end
