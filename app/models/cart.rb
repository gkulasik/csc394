class Cart < ActiveRecord::Base
belongs_to :customer
belongs_to :item
validates :customer_id, :item_id, presence: true

end
