class Cart < ActiveRecord::Base
belongs_to :customer
has_one :item
validates :customer_id, :item_id, presence: true

end
